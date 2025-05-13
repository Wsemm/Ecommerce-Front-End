import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonLnag extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLnag(
      {super.key, required this.textbutton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
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
