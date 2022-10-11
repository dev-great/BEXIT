import 'package:bexit/app/app_colors.dart';
import 'package:flutter/material.dart';

const bodyTextStyle = TextStyle(
  fontSize: 12,
  fontFamily: 'Montserrat',
  color: AppColor.textColor,
  fontWeight: FontWeight.normal,
);

const headerTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 16,
  color: AppColor.textColor,
  fontWeight: FontWeight.w500,
);

const subHeaderTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14,
  color: AppColor.textColor,
  fontWeight: FontWeight.w500,
);

InputDecoration kInputDecoration = InputDecoration(
  isDense: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor.withOpacity(0.1),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    borderSide: BorderSide(
      color: AppColor.primaryColor.withOpacity(0.3),
      width: 1.5,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.dangerColor,
      width: 1.5,
    ),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: AppColor.dangerColor,
      width: 1.5,
    ),
  ),
);
