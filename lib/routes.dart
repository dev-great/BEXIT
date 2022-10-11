import 'package:bexit/screens/authentication/signin.dart';
import 'package:bexit/screens/authentication/signup.dart';
import 'package:bexit/screens/base.dart';
import 'package:bexit/screens/splash_screen.dart';
import 'package:bexit/screens/user/edit_user_profile.dart';
import 'package:bexit/screens/user/user_profile.dart';
import 'package:flutter/material.dart';

var customRoutes = <String, WidgetBuilder>{
  SplashScreen.route: (context) => const SplashScreen(),
  SignIn.route: (context) => const SignIn(),
  SignUp.route: (context) => const SignUp(),
  EditUserProfile.route: (context) => const EditUserProfile(),
  UserProfile.route: (context) => const UserProfile(),
  Base.route: (context) => const Base(),
};
