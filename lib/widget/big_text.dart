import 'package:flutter/material.dart';
import 'package:food_devlivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double? size;
  TextOverflow overflow;

  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key); // Add key parameter
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == null ? Dimensions.font20 : size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
