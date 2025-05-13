import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomOrderButton extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomOrderButton(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        // shape: ContinuousRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(100))),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
