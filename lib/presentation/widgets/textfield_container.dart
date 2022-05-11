import 'package:flutter/material.dart';
import 'package:flutter_job_one/utils/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: color ?? COLOR_GREY.withAlpha(20),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
