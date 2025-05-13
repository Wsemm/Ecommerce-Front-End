import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  // final String? TextButton;
  final IconData iconData;
  final bool? active;

  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      //  required this.TextButton,
      required this.iconData,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: active == true ? Colors.white : AppColor.Deepgrey,
            ),
            // Text(
            //   TextButton,
            //   style: TextStyle(
            //       color:
            //           active == true ? AppColor.primaryColor : AppColor.Deepgrey),
            // )
          ],
        ),
      ),
    );
  }
}
