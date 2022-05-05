import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/add_property_screen.dart';
import 'package:flutter_job_one/presentation/screens/detail_screen.dart';
import 'package:flutter_job_one/presentation/screens/edit_property_screen.dart';
import 'package:flutter_job_one/presentation/screens/email_login_screen.dart';
import 'package:flutter_job_one/presentation/screens/nav_screen.dart';
import 'package:flutter_job_one/presentation/screens/otp_input_screen.dart';
import 'package:flutter_job_one/presentation/screens/phone_number_login_screen.dart';
import 'package:flutter_job_one/presentation/screens/phone_number_signup_screen.dart';
import 'package:flutter_job_one/presentation/screens/register_screen.dart';
import 'package:flutter_job_one/presentation/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generageRoute(RouteSettings settings) {
    switch (settings.name) {
      case navRoute:
        return MaterialPageRoute(builder: (_) => NavScreen());
      case phoneNumberLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberLoginScreen(),
        );
      case emailLoginRoute:
        return MaterialPageRoute(
          builder: (_) => const EmailLoginScreen(),
        );
      case addListingRoute:
        return MaterialPageRoute(
          builder: (_) => const AddPropertyScreen(),
        );
      case detailRoute:
        return MaterialPageRoute(
          builder: (_) => const DetailScreen(),
        );
      // case favouriteRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const FavouriteScreen(),
      //   );
      // case homeRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      case otpInputRoute:
        return MaterialPageRoute(
          builder: (_) => const OtpInputScreen(),
        );
      case registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      // case editProfileRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const EditProfileScreen(),
      //   );
      // case propertyRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const PropertyScreen(),
      //   );
      case phoneNumberRegisterRoute:
        return MaterialPageRoute(
          builder: (_) => const PhoneNumberSignupScreen(),
        );
      case editPropertyRoute:
        return MaterialPageRoute(
          builder: (_) => const EditPropertyScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
