import 'package:webspc/resource/Home/BookingScreen.dart';
import 'package:webspc/resource/Home/View_hisbooking.dart';
import 'package:webspc/resource/Home/family_screen.dart';
import 'package:webspc/resource/Home/home_page.dart';
import 'package:webspc/resource/Profile/view_history.dart';
import 'package:webspc/resource/Login&Register/login_page.dart';
import 'package:webspc/resource/Home/Parking_spot.dart';
import 'package:webspc/resource/Profile/topup_page.dart';
import 'package:webspc/styles/plash_screen.dart';
import 'package:webspc/undefined_view.dart';
import 'package:flutter/material.dart';

import 'resource/Login&Register/reset_password.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final arg = settings.arguments;
  switch (settings.name) {
    // case "/":
    //   return MaterialPageRoute(builder: (context)=> const SplashScreen());
    case "/":
      return MaterialPageRoute(builder: (context) => LoginScreen(context));
    // case HomeScreen.routeName:
    //   return MaterialPageRoute(builder: (context) => HomeScreen(context));
    // case AccountPage.routeName:
    //   return MaterialPageRoute(builder: (context) => AccountPage(context));
    case "/homeScreen":
      return MaterialPageRoute(builder: (context) => HomeScreen(context));
    case TopupScreen.routeName:
      return MaterialPageRoute(builder: (context) => TopupScreen(context));
    case Booking1Screen.routerName:
      return MaterialPageRoute(builder: (context) => Booking1Screen(context));
    case ViewHistoryPage.routerName:
      return MaterialPageRoute(builder: (context) => ViewHistoryPage(context));
    case viewSpotPage.routerName:
      return MaterialPageRoute(builder: (context) => viewSpotPage(context));
    case ResetPasswordScreen.routeName:
      return MaterialPageRoute(builder: (context) => ResetPasswordScreen());
    case ViewHistoryPage.routerName:
      return MaterialPageRoute(
          builder: (context) => ViewUserHistoryPage(context));
    case FamilyScreen.routerName:
      return MaterialPageRoute(builder: (context) => FamilyScreen(context));
    // case ForgotPasswordScreen.routeName:
    // return MaterialPageRoute(builder: (context) => ForgotPasswordScreen(context));
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name.toString()));
  }
}
