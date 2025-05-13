import 'core/functions/checkInternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  var res;
  initialdata() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    initialdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double Screen_Height = MediaQuery.of(context).size.height;
    double Screen_Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text("Test")),
          OtpTextField(
            fieldWidth: Screen_Width * 0.13,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String VerificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("verification Code"),
                      content: Text("Code entred is $VerificationCode"),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
