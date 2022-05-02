import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/app_router.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;

    return MaterialApp(
      title: 'Verenda.et',
      theme: ThemeData(
        primaryColor: COLOR_PRIMARY,
        accentColor: COLOR_SECONDARY,
      ),
      initialRoute: onBoardingRoute,
      onGenerateRoute: AppRouter.generageRoute,
    );
  }
}
