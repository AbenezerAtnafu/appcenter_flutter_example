import 'package:flutter/material.dart';
import 'package:flutter_job_one/utils/constants.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget addHorizontalDividerWithText(String text) {
  return Row(
    children: [
      const Expanded(
        child: Divider(
          endIndent: 10,
          color: COLOR_GREY,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          color: COLOR_GREY.withAlpha(80),
        ),
      ),
      const Expanded(
        child: Divider(
          indent: 10,
          color: COLOR_GREY,
        ),
      ),
    ],
  );
}
