import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class OtpInputScreen extends StatefulWidget {
  const OtpInputScreen({Key? key}) : super(key: key);

  @override
  _OtpInputScreenState createState() => _OtpInputScreenState();
}

class _OtpInputScreenState extends State<OtpInputScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 30);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 3));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        print('hey');
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    countdownTimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = strDigits(myDuration.inMinutes);
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: COLOR_WHITE,
          elevation: 0.0,
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                color: COLOR_GREY.withAlpha(20),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: COLOR_BLACK,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: sidePadding,
            width: size.width,
            height: size.height - kToolbarHeight - kBottomNavigationBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        text: ' +2519********',
                        style: themeData.textTheme.bodyText2!.copyWith(
                          color: COLOR_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding * 2),
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
                addVerticalSpace(padding),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.75, 60),
                      primary: COLOR_PRIMARY,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _otp =
                            '${_fieldOne.text}${_fieldTwo.text}${_fieldThree.text}${_fieldFour.text}';
                      });
                      print('hey');
                      print(_otp);
                    },
                    child: const Text('Submit'),
                  ),
                ),
                myDuration.inSeconds > 0
                    ? Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                  const Icon(
                                    Icons.timer,
                                    color: COLOR_SECONDARY,
                                  ),
                                  addHorizontalSpace(7),
                                  Text(
                                    '$minutes:$seconds',
                                    style:
                                        themeData.textTheme.bodyText2!.copyWith(
                                      color: COLOR_SECONDARY,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                // TODO : send resend functionality here and start timer
                                resetTimer();
                                // startTimer();
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Didn't receive the OTP?",
                                  style:
                                      themeData.textTheme.bodyText2!.copyWith(
                                    color: COLOR_SECONDARY,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Resend OTP',
                                      style: themeData.textTheme.bodyText2!
                                          .copyWith(
                                        color: COLOR_SECONDARY,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                addVerticalSpace(padding),
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
