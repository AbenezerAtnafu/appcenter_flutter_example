import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberLoginScreen extends StatefulWidget {
  const PhoneNumberLoginScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberLoginScreenState createState() => _PhoneNumberLoginScreenState();
}

class _PhoneNumberLoginScreenState extends State<PhoneNumberLoginScreen> {
  String phoneNumber = '';

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding * 2),
                RichText(
                  text: TextSpan(
                    text: "Let's",
                    style: themeData.textTheme.headline4!.copyWith(
                      color: COLOR_SECONDARY,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign In',
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
                  'Enter your phone number to sign in',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width * 0.75, 70),
                        primary: COLOR_PRIMARY,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        print(phoneNumber);

                        Navigator.pushNamed(context, otpInputRoute);
                      },
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
                addVerticalSpace(padding),
                addHorizontalDividerWithText('OR'),
                addVerticalSpace(padding),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, emailLoginRoute);
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
                        Navigator.pushNamed(context, phoneNumberRegisterRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: themeData.textTheme.bodyText2,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Register',
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
