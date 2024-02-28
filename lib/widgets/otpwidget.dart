import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpFieldWidget extends StatefulWidget {
  const OtpFieldWidget({Key? key}) : super(key: key);

  @override
  _OtpFieldWidgetState createState() => _OtpFieldWidgetState();
}

class _OtpFieldWidgetState extends State<OtpFieldWidget> {
  int start = 30;
  bool isWaiting = false;
  String buttonName = "Send";
  String verificationIdFinal = "";
  String smsCode = "";
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Adjust the width as needed
      height: 100, // Adjust the height as needed
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: OTPTextField(
          length: 4,
          width: 150,
          fieldWidth: 58,
          otpFieldStyle: OtpFieldStyle(
            backgroundColor: Colors.white,
            borderColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            setState(() {
              smsCode = pin;
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
