import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sindebad/core/styles/size_utils.dart';

import '../../../core/styles/app_colors.dart';
import '../logic/otp_view_controller.dart';

class OtpView extends ConsumerStatefulWidget {
  const OtpView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends ConsumerState<OtpView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
  StreamController<ErrorAnimationType>();

  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then(
          (_) async {},
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 35.hsbt0,
                child: Stack(
                  children: [
                    const TopClipperWidget(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.only(top: 12.5.wsbt0),
                        child: Text(
                          AppLocalizations.of(context)!.otpWillBeSent,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                              color: AppColors.white,
                              fontSize: 19.0.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppLocalizations.of(context)!.makeSureFromPhoneNumber,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .continueChangePasswordProcess,
                        style:
                        Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                          color: AppColors.lightBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PinCodeTextField(
                        key: const Key('otp'),
                        length: 4,
                        obscureText: false,
                        appContext: context,
                        controller: otpController,
                        errorAnimationController: errorController,
                        keyboardType: TextInputType.number,
                        // validator: MultiValidator([
                        //   Validator.of(context)!.required(
                        //     AppLocalizations.of(context)!.otp,
                        //   ),
                        //   Validator.of(context)!.minLength(
                        //       ValidationLocalizations.of(context)!.phone, 6),
                        // ]),
                        onSaved: (otp) {},
                        textStyle:
                        Theme
                            .of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                          color: AppColors.grey,
                          fontSize: 19.0.sp,
                        ),
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                            fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 3.wsbt0),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            fieldHeight: 60,
                            fieldWidth: 60,
                            borderWidth: 0.0,
                            activeFillColor: AppColors.lightGrey,
                            inactiveFillColor: AppColors.lightGrey,
                            inactiveColor: AppColors.lightGrey,
                            errorBorderColor: Colors.red,
                            activeColor: AppColors.lightGrey,
                            selectedColor: AppColors.lightGrey,
                            selectedFillColor: AppColors.lightGrey),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        onCompleted: (v) {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigateToHomeMenuView(context: context);
                        },
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.activate,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 4.hs,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 4),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 12,
                              child: Wrap(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .iDidNotReceiveCode,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 30,
                              child: GestureDetector(
                                onTap: () {},
                                child: Wrap(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.resendOtp,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                          color:
                                          AppColors.secondarySwatch),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    errorController.close();

    super.dispose();
  }
}

class TopClipperWidget extends StatelessWidget {
  const TopClipperWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primarySwatch[300],
        ),
        const QuarterCircle(),
      ],
    );
  }
}

class QuarterCircle extends StatelessWidget {
  final Color color;

  const QuarterCircle({
    super.key,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  const QuarterCirclePainter();

  final Color fillColor = AppColors.primaryColor;
  final double littleGap = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final double curveHeight = 35.hsbt0;
    final double curveWidth = 100.wsbt0;

    final paint = Paint()
    // parametrize
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path = Path()
    // parametrize
      ..lineTo(curveWidth + 5, 0)
    //main right curve:
      ..cubicTo(
        curveWidth,
        15.hsbt0,
        curveWidth - 33.wsbt0,
        curveHeight - 1.hsbt0,
        curveWidth - 100.wsbt0,
        curveHeight,
      )
      ..lineTo(0, curveHeight)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
