import 'package:bexit/app/add_decoration.dart';
import 'package:bexit/app/app_button.dart';
import 'package:bexit/app/app_colors.dart';
import 'package:bexit/app/app_string.dart';
import 'package:bexit/logic/user_logic.dart';
import 'package:bexit/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String route = 'signUp';
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email = '';
  String _confpassword = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  _registerNow() async {
    var isvalid = _form.currentState?.validate();
    if (!isvalid!) {
      return;
    }
    _form.currentState?.save();
    bool isregis = await Provider.of<UserLogic>(
      context,
      listen: false,
    ).register(_password, _email);
    if (isregis) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const Base())));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Something is wrong.Try Again"),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColor.blackColor,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(AppStrings.signUp, style: headerTextStyle),
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
                  height: 10,
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
                  height: 10,
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
                    _confpassword = v!;
                  },
                  validator: (v) {
                    if (v!.isEmpty) {
                      return AppStrings.validatePassword;
                    }
                    return null;
                  },
                ),
                const Spacer(),
                PrimaryBtn(
                    title: AppStrings.continueText,
                    onPress: () {
                      _registerNow();
                    }),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
