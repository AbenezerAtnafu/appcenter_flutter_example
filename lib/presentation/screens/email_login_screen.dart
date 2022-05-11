import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/widgets/textfield_container.dart';
import 'package:flutter_job_one/service/models/user.dart';
import 'package:flutter_job_one/service/repository/repository.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/persistent.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final ApiClients apiClients = ApiClients();
  bool isPasswordVisible = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25.0;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: SingleChildScrollView(
          child: Container(
            padding: sidePadding,
            width: size.width,
            height: size.height - kToolbarHeight - kBottomNavigationBarHeight,
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
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      error != ''
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  error,
                                  style: themeData.textTheme.bodySmall!
                                      .copyWith(color: Colors.redAccent),
                                ),
                              ),
                            )
                          : Container(),
                      TextFieldContainer(
                        child: FormBuilderTextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email_outlined,
                              color: COLOR_SECONDARY,
                            ),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          name: 'email',
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Email is required',
                            ),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                      ),
                      addVerticalSpace(padding / 2),
                      TextFieldContainer(
                        child: FormBuilderTextField(
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_outline_rounded,
                              color: COLOR_SECONDARY,
                            ),
                            hintText: 'Password',
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: !isPasswordVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              color: COLOR_SECONDARY,
                            ),
                          ),
                          name: 'password',
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: 'Password is required',
                              ),
                              FormBuilderValidators.minLength(6,
                                  errorText:
                                      'Password length must be greater than 6 letters'),
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(10),
                      TextButton(
                        onPressed: () {
                          _forgotPassword();
                        },
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
                          onPressed: () async {
                            if (_formKey.currentState!.saveAndValidate()) {
                              String email =
                                  _formKey.currentState!.value['email'];
                              String password =
                                  _formKey.currentState!.value['password'];
                              // Navigator.pushNamed(context, navRoute);
                              dynamic user =
                                  await apiClients.login(email, password);
                              if (user is String) {
                                setState(() {
                                  error = user;
                                });
                              } else if (user is User) {
                                // print(user.userLogin!.authenticatable!.email);
                                setState(() {
                                  error = '';
                                });
                                Helper.saveUserData(user);
                                Navigator.of(context).pushNamed(navRoute);
                              }
                            }
                          },
                          child: const Text('Sign in'),
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                addHorizontalDividerWithText('OR'),
                addVerticalSpace(padding),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          phoneNumberLoginRoute,
                        );
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
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
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

void _forgotPassword() async {
  if (!await launchUrl(Uri.parse('https://www.verenda.et/')))
    throw 'Could not launch https://www.verenda.et/';
}
