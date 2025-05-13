import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_InkWell extends StatelessWidget {
  const Custom_InkWell({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
  });
  final String title;
  final Color color;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
