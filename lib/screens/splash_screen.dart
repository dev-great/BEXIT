import 'package:bexit/app/app_colors.dart';
import 'package:bexit/app/app_string.dart';
import 'package:bexit/screens/authentication/signup.dart';
import 'package:bexit/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _splash() async {
    LocalStorage storage = LocalStorage('userCredentials');
    await Future.delayed(const Duration(milliseconds: 4000), () {
      FutureBuilder(
        future: storage.ready,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (storage.getItem('token') == null) {
            return const SignUp();
          }
          return const Base();
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _splash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: AppColor.whiteColor,
        duration: const Duration(milliseconds: 6000),
        child: const Center(
            child: Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: 35.0,
            fontFamily: "Montserrat",
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
