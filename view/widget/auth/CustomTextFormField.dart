import '../../../core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hinttext,
    required this.iconData,
    required this.myController,
    required this.valid,
    this.keyboardType,
    this.obsecure,
    this.onPressedIcon,
  });
  final String label, hinttext;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final bool? obsecure;
  final void Function()? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure == null || obsecure == false ? false : true,
      keyboardType: keyboardType,
      validator: valid,
      cursorColor: AppColor.primaryColor,
      controller: myController,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: AppColor.primaryColor)),
          hintText: hinttext,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color.fromARGB(255, 117, 115, 115)),
          suffixIconColor: AppColor.primaryColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                label,
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              )),
          suffixIcon: InkWell(onTap: onPressedIcon, child: Icon(iconData)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
