import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/widgets/textfield_container.dart';
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
        backgroundColor: COLOR_WHITE,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: COLOR_WHITE,
          elevation: 0.0,
          leadingWidth: 100,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: TextStyle(color: COLOR_BLACK),
          ),
          // leading: InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(left: 10, top: 10),
          //     decoration: BoxDecoration(
          //       color: COLOR_GREY.withAlpha(20),
          //       shape: BoxShape.circle,
          //     ),
          //     width: 50,
          //     height: 50,
          //     child: const Icon(
          //       Icons.arrow_back_ios_new_rounded,
          //       color: COLOR_BLACK,
          //     ),
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: sidePadding,
            width: size.width,
            height: size.height - kToolbarHeight - kBottomNavigationBarHeight,
            child: Column(
              children: [
                addVerticalSpace(padding),
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
                addVerticalSpace(padding),
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
                addVerticalSpace(padding),
                Center(
                  child: Text(
                    'Follow us on',
                    style: themeData.textTheme.bodyText1,
                  ),
                ),
                addVerticalSpace(10),
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
              ],
            ),
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
