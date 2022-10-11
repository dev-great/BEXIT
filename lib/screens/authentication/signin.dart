import 'package:bexit/app/add_decoration.dart';
import 'package:bexit/app/app_button.dart';
import 'package:bexit/app/app_colors.dart';
import 'package:bexit/app/app_string.dart';
import 'package:bexit/logic/user_logic.dart';
import 'package:bexit/screens/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static const String route = 'signIn';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email = '';
  String _password = '';
  final _form = GlobalKey<FormState>();
  void _loginNew() async {
    var isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    _form.currentState?.save();
    bool isLoggedIn = await Provider.of<UserLogic>(
      context,
      listen: false,
    ).login(_email, _password);
    if (isLoggedIn) {
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                  "Incorrect Log In credentials. Confirm your username and password again!"),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.signIn,
                      style: headerTextStyle.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: kInputDecoration.copyWith(
                        filled: true,
                        fillColor: AppColor.primaryColor.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        labelText: AppStrings.email,
                        labelStyle:
                            bodyTextStyle.copyWith(color: AppColor.textColor),
                      ),
                      onSaved: (v) {
                        _email = v!;
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return AppStrings.validateEmail;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: kInputDecoration.copyWith(
                        filled: true,
                        fillColor: AppColor.primaryColor.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColor.textColor,
                        ),
                        labelText: AppStrings.password,
                        labelStyle:
                            bodyTextStyle.copyWith(color: AppColor.textColor),
                      ),
                      onSaved: (v) {
                        _password = v!;
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return AppStrings.validatePassword;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    PrimaryBtn(title: AppStrings.continueText, onPress: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.dontHaveAccount,
                            style: bodyTextStyle.copyWith(fontSize: 14)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUp.route);
                          },
                          child: Text(
                            AppStrings.signUp,
                            style: bodyTextStyle.copyWith(
                              fontSize: 14,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
