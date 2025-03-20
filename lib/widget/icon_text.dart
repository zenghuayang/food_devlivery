import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  double? size;

  IconAndText({
    Key? key,
    required this.text,
    required this.icon,
    this.size,
    this.iconColor = const Color(0xFF89dad0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: size == null ? Dimensions.font16 : size),
        ),
      ],
    );
  }
}
