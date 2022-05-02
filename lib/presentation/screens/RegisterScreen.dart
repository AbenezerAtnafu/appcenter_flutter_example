import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/EmailLoginScreen.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
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
                addVerticalSpace(padding * 2),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email_outlined,
                        color: COLOR_SECONDARY,
                      ),
                      hintText: 'Full name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email_outlined,
                        color: COLOR_SECONDARY,
                      ),
                      hintText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                addVerticalSpace(padding / 2),
                TextFieldContainer(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline_rounded,
                        color: COLOR_SECONDARY,
                      ),
                      hintText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: COLOR_SECONDARY,
                      ),
                    ),
                  ),
                ),
                addVerticalSpace(10),
                RichText(
                  text: TextSpan(
                    text: 'By creating an account you have agreed to our',
                    style: themeData.textTheme.bodyText1,
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Terms of service',
                        style: themeData.textTheme.bodyText1!.copyWith(
                          color: COLOR_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
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
                        Navigator.pushNamed(context, navRoute);
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
