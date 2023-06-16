import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/hive_boxes.dart';


final locator = GetIt.instance;

Future<void> initialize() async {
  // init firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // init Hive
  await _initializeHive();

  // init internationalization
  await _initializeInternationalization();

  //init Dio
  await initializeDio();

  //general initialization
  await _generalInitialization();
}

Future<void> initializeFlutterFire() async {}

_generalInitialization() {}

Future _initializeInternationalization() async {
  locator.registerLazySingleton<Locale>(() {
    return Locale(Hive.box(
      HiveBoxes.settingsHiveBoxName,
    ).get(HiveKeys.internationalizationKey, defaultValue: 'ar'));
  });
}

Future _initializeHive() async {
  await Hive.initFlutter();

  registerAdapters();

  await openHiveBoxes();
}

void registerAdapters() {
  // Hive.registerAdapter(RetailerAdapter());
}

Future<void> openHiveBoxes() async {
  await Hive.openBox(
    HiveBoxes.settingsHiveBoxName,
  );
}

Future initializeDio() async {}
