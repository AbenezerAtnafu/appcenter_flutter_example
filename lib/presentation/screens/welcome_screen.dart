import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(phoneNumberLoginRoute),
    );
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/verenda_logo.svg',
              semanticsLabel: 'Verenda Logo',
            ),
            addVerticalSpace(padding),
            Text(
              'verenda.et',
              style: themeData.textTheme.headline5!.copyWith(
                color: COLOR_PRIMARY,
              ),
            )
          ],
        ),
      ),
    );
  }
}
