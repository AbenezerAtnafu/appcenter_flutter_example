import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/widgets/textfield_container.dart';
import 'package:flutter_job_one/service/models/userSignUp.dart';
import 'package:flutter_job_one/service/repository/repository.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

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
                Center(
                  child: FormBuilder(
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
                                Icons.person,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Full name',
                              border: InputBorder.none,
                            ),
                            name: 'fullName',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Fullname is required',
                              ),
                            ]),
                          ),
                        ),
                        addVerticalSpace(padding / 2),
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
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock_outline_rounded,
                                color: COLOR_SECONDARY,
                              ),
                              hintText: 'Password',
                              border: InputBorder.none,
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
                        InkWell(
                          onTap: () {
                            _termsAndConditionUrl();
                          },
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'By creating an account you have agreed to our',
                              style: themeData.textTheme.bodyText1,
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Terms of service',
                                  style:
                                      themeData.textTheme.bodyText1!.copyWith(
                                    color: COLOR_PRIMARY,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                            onPressed: () async {
                              if (_formKey.currentState!.saveAndValidate()) {
                                String fullName =
                                    _formKey.currentState!.value['fullName'];
                                String email =
                                    _formKey.currentState!.value['email'];
                                String password =
                                    _formKey.currentState!.value['password'];
                                dynamic user = await ApiClients()
                                    .signUp(fullName, email, password);

                                if (user is String) {
                                  setState(() {
                                    error = user;
                                  });
                                } else if (user is UserSignedUp) {
                                  setState(() {
                                    error = '';
                                    // _formKey.currentState!.reset();
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                        SnackBar(
                                          duration: const Duration(seconds: 10),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          elevation: 10.0,
                                          backgroundColor: COLOR_WHITE,
                                          content: WillPopScope(
                                            onWillPop: () async {
                                              ScaffoldMessenger.of(context)
                                                  .removeCurrentSnackBar();
                                              return true;
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Registration Succesfull !!',
                                                  style: themeData
                                                      .textTheme.headline5!
                                                      .copyWith(
                                                    color: COLOR_PRIMARY,
                                                  ),
                                                ),
                                                addVerticalSpace(padding / 2),
                                                RichText(
                                                  text: TextSpan(
                                                    text:
                                                        'We have sent you a confirmation email at ',
                                                    style: themeData
                                                        .textTheme.bodyText2!
                                                        .copyWith(
                                                      color: COLOR_BLACK,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text:
                                                            '${user.userSignUp!.authenticatable!.email}',
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                print('hey');
                                                              },
                                                        style: themeData
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                          color: COLOR_PRIMARY,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '. Please confirm your email and sign in with your credentials',
                                                        style: themeData
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                          color: COLOR_BLACK,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                      .closed
                                      .then((value) => Navigator.of(context)
                                          .pushNamed(emailLoginRoute));
                                  // Navigator.of(context)
                                  //     .pushNamed(emailLoginRoute);
                                }
                              }
                              // Navigator.pushNamed(context, navRoute);
                            },
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
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
                        Navigator.pushNamed(context, phoneNumberRegisterRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Use',
                          style: themeData.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Phonenumber',
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
                        Navigator.pushNamed(context, emailLoginRoute);
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

void _termsAndConditionUrl() async {
  if (!await launchUrl(Uri.parse('https://www.verenda.et/privacy')))
    throw 'Could not launch https://www.verenda.et/privacy';
}
