import 'package:flutter/material.dart';

///TODO : add the rest of commands

class SizeUtils {
  /// MediaQueryData
  static late MediaQueryData _mediaQueryData;

  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static Orientation orientation = Orientation.portrait;

  /// Device's Width
  static late double screenWidth;

  /// Device's Height
  static late double screenHeight;

  /// Horizontal block size
  static late double blockSizeHorizontal;

  /// Vertical block size
  static late double blockSizeVertical;

  static late double safeAreaHorizontal;
  static late double safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static double screenHeightNoPadding = 0;
  static double screenHeightNoPaddingNoAppbar = 0;
  static double statusBarHeight = 0;
  static double bottomBarHeight = 0;
  static double appBarHeight = 0;
  static double appBarAndStatusBarHeight = 0;

  static double pixelRatio = 0;
  static double textScaleFactor = 0;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData.orientation;

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeAreaVertical) / 100;

    statusBarHeight = _mediaQueryData.padding.top;
    appBarHeight = AppBar().preferredSize.height;
    bottomBarHeight = _mediaQueryData.padding.bottom;
    appBarAndStatusBarHeight = appBarHeight + statusBarHeight;

    screenHeightNoPadding =
        _mediaQueryData.size.height - statusBarHeight - bottomBarHeight;
    screenHeightNoPaddingNoAppbar = screenHeightNoPadding - appBarHeight;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    textScaleFactor = _mediaQueryData.textScaleFactor;
  }

  static double screenHeightNoPaddingNoCustomAppbarHeight(
      {required num customAppbarHeight}) {
    return _mediaQueryData.size.height -
        statusBarHeight -
        bottomBarHeight -
        customAppbarHeight;
  }

  static double calculateMedian(num size) {
    double widthPercent = size * (screenWidth / 3) / 100;
    double heightPercent = (size * (screenHeight / 3) / 100);

    List<double> mList = [widthPercent, heightPercent];
//sort list
    mList.sort((a, b) => a.compareTo(b));

    double median;

    int middle = mList.length ~/ 2;
    if (mList.length % 2 == 1) {
      median = mList[middle].toDouble() - 1;
    } else {
      median = ((mList[middle - 1] + mList[middle]) / 2.0) - 1;
    }

    return median;
  }

  static double calculateMedianMoreThanZero(num size) {
    final median = calculateMedian(size);

    return median < 1 ? size.toDouble() : median;
  }

  static double widthMoreThanZero(num size) {
    final result = size * SizeUtils.screenWidth / 100;

    return result < 1 ? size.toDouble() : result;
  }

  static double heightMoreThanZero(num size) {
    final result = size * SizeUtils.screenHeight / 100;

    return result < 1 ? size.toDouble() : result;
  }

}

extension DynamicItemSize on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get hs => this * SizeUtils.screenHeight / 100;

  /// Calculates the width depending on the device's screen size and result is bigger than 0
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get hsbt0 => SizeUtils.heightMoreThanZero(this);

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get ws => this * SizeUtils.screenWidth / 100;

  /// Calculates the width depending on the device's screen size and result is bigger than 0
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get wsbt0 => SizeUtils.widthMoreThanZero(this);

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get ms => SizeUtils.calculateMedian(this);

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size and result is bigger than 0
  double get msbt0 => SizeUtils.calculateMedianMoreThanZero(this);
}


