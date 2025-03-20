import 'package:flutter/material.dart';
import 'package:food_devlivery/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double? size;
  double height;
  TextOverflow overflow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size,
      this.height = 1.5,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key); // Add key parameter
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == null ? Dimensions.font16 : size,
        height: height,
      ),
    );
  }
}
