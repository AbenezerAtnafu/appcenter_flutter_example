import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberSignupScreen extends StatefulWidget {
  const PhoneNumberSignupScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberSignupScreenState createState() =>
      _PhoneNumberSignupScreenState();
}

class _PhoneNumberSignupScreenState extends State<PhoneNumberSignupScreen> {
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding * 2),
                RichText(
                  text: TextSpan(
                    text: 'Create your',
                    style: themeData.textTheme.headline4!.copyWith(
                      color: COLOR_SECONDARY,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' account',
                        style: themeData.textTheme.headline4!.copyWith(
                          color: COLOR_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Text(
                  'Create your account to save and post listings',
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: COLOR_SECONDARY,
                  ),
                ),
                addVerticalSpace(padding),
                IntlPhoneField(
                  flagsButtonPadding: const EdgeInsets.only(left: 10),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: COLOR_GREY.withAlpha(80),
                        width: 0.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: COLOR_PRIMARY,
                      ),
                    ),
                  ),
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    setState(() {
                      phoneNumber = phone.completeNumber;
                    });
                  },
                  // onSaved: (phone) => {print(phone)},
                ),
                addVerticalSpace(padding / 2),
                Text(
                  'You will receive an SMS verification that may apply message and data rates',
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: COLOR_GREY,
                  ),
                ),
                addVerticalSpace(padding * 2),
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
                      print(phoneNumber);
                      Navigator.pushNamed(context, otpInputRoute);
                    },
                    child: const Text('Send code'),
                  ),
                ),
                addVerticalSpace(padding * 2),
                addHorizontalDividerWithText('OR'),
                addVerticalSpace(padding * 2),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, registerRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Use',
                          style: themeData.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Email',
                              style: themeData.textTheme.bodyText2!.copyWith(
                                color: COLOR_PRIMARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, phoneNumberLoginRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: themeData.textTheme.bodyText2,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Login',
                              style: themeData.textTheme.bodyText2!.copyWith(
                                color: COLOR_PRIMARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
