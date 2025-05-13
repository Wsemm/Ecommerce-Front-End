import '../../../controller/ForgetPassword/VerifiyCode_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class CustomOtpTextField extends StatelessWidget {
  const CustomOtpTextField({super.key, required this.onSubmit});
  final void Function(String) onSubmit;
  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return OtpTextField(
        fieldWidth: Screen_Width * 0.13,
        borderRadius: BorderRadius.circular(20),
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        showFieldAsBox: true,
        onCodeChanged: (String code) {},
        onSubmit: onSubmit

        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         title: Text("verification Code"),
        //         content: Text("Code entred is $VerificationCode"),
        //       );
        //     });

        );
  }
}
