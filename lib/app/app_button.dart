import 'package:bexit/app/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
    Key? key,
    this.color,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  Color? color;
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: SizedBox(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: color ?? AppColor.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.normal,
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
