import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;

  const IconAndText({
    Key? key,
    required this.text,
    required this.icon,
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
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
