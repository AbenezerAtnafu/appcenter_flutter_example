import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
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
                Image.asset('assets/images/login_header.png'),
                addVerticalSpace(padding),
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
                  'Enter your email and password to sign in.',
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: COLOR_SECONDARY,
                  ),
                ),
                addVerticalSpace(padding * 1.5),
                const TextFieldContainer(
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
                const TextFieldContainer(
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
                addVerticalSpace(4),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: themeData.textTheme.bodyText2!.copyWith(
                      color: COLOR_SECONDARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                addVerticalSpace(10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.75, 50),
                      primary: COLOR_PRIMARY,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, navRoute);
                    },
                    child: const Text('Sign in'),
                  ),
                ),
                addVerticalSpace(padding),
                addHorizontalDividerWithText('OR'),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, phoneNumberLoginRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Use',
                          style: themeData.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Phone Number',
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
                addVerticalSpace(10),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, registerRoute);
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

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color ?? COLOR_GREY.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
