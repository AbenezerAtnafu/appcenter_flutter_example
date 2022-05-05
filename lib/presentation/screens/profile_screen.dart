import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/email_login_screen.dart';
import 'package:flutter_job_one/utils/constants.dart';
import 'package:flutter_job_one/utils/widgets_functions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _facebookUrl = Uri.parse('https://facebook.com');
final Uri _linkedinUrl = Uri.parse('https://linkedin.com');
final Uri _telegramUrl = Uri.parse('https://telegram.com');
final Uri _instagramUrl = Uri.parse('https://instagram.com');
final Uri _twitterUrl = Uri.parse('https://twitter.com');

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
        body: Container(
          padding: sidePadding,
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              addVerticalSpace(padding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: COLOR_BLACK,
                      ),
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: themeData.textTheme.headline6,
                  ),
                  Container()
                ],
              ),
              addVerticalSpace(padding * 2),
              const TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.account_circle,
                      color: COLOR_SECONDARY,
                    ),
                    hintText: 'Michael Solomon',
                    border: InputBorder.none,
                  ),
                ),
              ),
              addVerticalSpace(padding / 2),
              const TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.phone,
                      color: COLOR_SECONDARY,
                    ),
                    hintText: '+251 966303009',
                    border: InputBorder.none,
                  ),
                ),
              ),
              addVerticalSpace(padding / 2),
              const TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email_outlined,
                      color: COLOR_SECONDARY,
                    ),
                    hintText: 'se.michael.solomon@gmail.com',
                    border: InputBorder.none,
                  ),
                ),
              ),
              addVerticalSpace(padding / 2),
              const TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.lock,
                      color: COLOR_SECONDARY,
                    ),
                    hintText: 'Change Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              addVerticalSpace(padding * 2),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(size.width * 0.75, 70),
                    primary: COLOR_PRIMARY,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, otpInputRoute);
                  },
                  child: const Text('Save'),
                ),
              ),
              addVerticalSpace(padding * 2),
              const Spacer(),
              Center(
                child: Text(
                  'Follow us on',
                  style: themeData.textTheme.bodyText1,
                ),
              ),
              addVerticalSpace(padding / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: COLOR_PRIMARY,
                      size: 30,
                    ),
                    onPressed: () {
                      _facebookLaunchUrl();
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: COLOR_PRIMARY,
                      size: 30,
                    ),
                    onPressed: () {
                      _linkedinLaunchUrl();
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.telegram,
                      color: COLOR_PRIMARY,
                      size: 30,
                    ),
                    onPressed: () {
                      _telegramLaunchUrl();
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.instagramSquare,
                      color: Colors.purple,
                      size: 30,
                    ),
                    onPressed: () {
                      _instagramLanuchUrl();
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: COLOR_PRIMARY.withAlpha(200),
                      size: 30,
                    ),
                    onPressed: () {
                      _twitterLaunchUrl();
                    },
                  ),
                ],
              ),
              addVerticalSpace(padding + 10),
            ],
          ),
        ),
      ),
    );
  }
}

void _facebookLaunchUrl() async {
  if (!await launchUrl(_facebookUrl)) throw 'Could not launch $_facebookUrl';
}

void _linkedinLaunchUrl() async {
  if (!await launchUrl(_linkedinUrl)) throw 'Could not launch $_linkedinUrl';
}

void _instagramLanuchUrl() async {
  if (!await launchUrl(_instagramUrl)) throw 'Could not launch $_instagramUrl';
}

void _telegramLaunchUrl() async {
  if (!await launchUrl(_telegramUrl)) throw 'Could not launch $_telegramUrl';
}

void _twitterLaunchUrl() async {
  if (!await launchUrl(_twitterUrl)) throw 'Could not launch $_twitterUrl';
}
