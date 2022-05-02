import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({Key? key}) : super(key: key);

  @override
  _OtpInputScreenState createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: sidePadding,
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: COLOR_GREY.withAlpha(40),
                      shape: BoxShape.circle,
                    ),
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
                addVerticalSpace(padding * 2),
                RichText(
                  text: TextSpan(
                    text: 'Enter the',
                    style: themeData.textTheme.headline4!.copyWith(
                      color: COLOR_SECONDARY,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' code',
                        style: themeData.textTheme.headline4!.copyWith(
                          color: COLOR_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                RichText(
                  text: TextSpan(
                    text: 'Enter the 4 digit code that we just sent to',
                    style: themeData.textTheme.bodyText2!.copyWith(
                      color: COLOR_SECONDARY,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' +251989574256',
                        style: themeData.textTheme.bodyText2!.copyWith(
                          color: COLOR_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpInput(_fieldOne, true),
                    addHorizontalSpace(16),
                    OtpInput(_fieldTwo, false),
                    addHorizontalSpace(16),
                    OtpInput(_fieldThree, false),
                    addHorizontalSpace(16),
                    OtpInput(_fieldFour, false)
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: COLOR_GREY.withAlpha(40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: COLOR_SECONDARY,
                          ),
                          addHorizontalSpace(7),
                          Text(
                            '00.21',
                            style: themeData.textTheme.bodyText2!.copyWith(
                              color: COLOR_SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                addVerticalSpace(padding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Didn\'t receive the OTP?',
                        style: themeData.textTheme.bodyText2!.copyWith(
                          color: COLOR_SECONDARY,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Resend OTP',
                            style: themeData.textTheme.bodyText2!.copyWith(
                              color: COLOR_SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(
                  padding * 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
