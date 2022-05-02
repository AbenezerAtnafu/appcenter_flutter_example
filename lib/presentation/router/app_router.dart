import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_one/presentation/router/routes.dart';
import 'package:flutter_job_one/presentation/screens/AddPropertyScreen.dart';
import 'package:flutter_job_one/presentation/screens/DetailScreen.dart';
import 'package:flutter_job_one/presentation/screens/EditProfileScreen.dart';
import 'package:flutter_job_one/presentation/screens/EmailLoginScreen.dart';
import 'package:flutter_job_one/presentation/screens/FavouriteScreen.dart';
import 'package:flutter_job_one/presentation/screens/HomeScreen.dart';
import 'package:flutter_job_one/presentation/screens/NavScreen.dart';
import 'package:flutter_job_one/presentation/screens/OnBoardingScreen.dart';
import 'package:flutter_job_one/presentation/screens/OtpInputScreen.dart';
import 'package:flutter_job_one/presentation/screens/PhoneNumberLoginScreen.dart';
import 'package:flutter_job_one/presentation/screens/PropertyScreen.dart';
import 'package:flutter_job_one/presentation/screens/RegisterScreen.dart';

class AppRouter {
  static Route<dynamic> generageRoute(RouteSettings settings) {
    switch (settings.name) {
      case navRoute:
        return MaterialPageRoute(builder: (_) => NavScreen());
      case phoneNumberLoginRoute:
        return MaterialPageRoute(builder: (_) => PhoneNumberLoginScreen());
      case emailLoginRoute:
        return MaterialPageRoute(builder: (_) => EmailLoginScreen());
      case addListingRoute:
        return MaterialPageRoute(builder: (_) => AddPropertyScreen());
      case detailRoute:
        return MaterialPageRoute(builder: (_) => DetailScreen());
      case favouriteRoute:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case otpInputRoute:
        return MaterialPageRoute(builder: (_) => OtpInputScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case editProfileRoute:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case propertyRoute:
        return MaterialPageRoute(builder: (_) => PropertyScreen());
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
