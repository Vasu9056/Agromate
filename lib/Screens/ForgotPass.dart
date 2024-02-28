import 'package:agromate/widgets/otpwidget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 110, 27),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  "Don't worry we got you!".text.color(Colors.black).make(),
                  SizedBox(height: 68),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: "Enter Your User Name:"
                          .text
                          .fontWeight(FontWeight.bold)
                          .make(),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.5),
                        ),
                        hintText: "Username",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.only(left: 13.5, right: 10.5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .85,
                        color: Color.fromARGB(224, 162, 220, 192),
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Get OTP",
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.5),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 27.5,
                              fontWeight: FontWeight.bold,
                            ),
                            minimumSize: Size(10, 50),
                            primary: Color.fromARGB(224, 162, 220, 192),
                            // alignment: Alignment.center,
                          ),
                        ),
                      ).onTap(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Otpverification()));
                      })),
                  120.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Image.asset("assets/leaf2.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Otpverification extends StatefulWidget {
  const Otpverification({super.key});
  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  int start = 30;
  bool isWaiting = false;
  String buttonname = "Send";
  String verificationIdFinal = "";
  String smscode = "";
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 110, 27),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Center(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: "Enter the verification code that we just"
                            .text
                            .color(Colors.black)
                            .make(),
                      ),
                    ),
                  ),
                  // 2.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child:
                        "sent to your Number".text.color(Colors.black).make(),
                  ),
                  10.heightBox,
                  OtpFieldWidget(),
                  10.heightBox,
                  Padding(
                      padding: const EdgeInsets.only(left: 13.5, right: 10.5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .85,
                        color: Color.fromARGB(224, 162, 220, 192),
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 33,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.5),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 27.5,
                              fontWeight: FontWeight.bold,
                            ),
                            minimumSize: Size(10, 50),
                            primary: Color.fromARGB(224, 162, 220, 192),
                            // alignment: Alignment.center,
                          ),
                        ),
                      ).onTap(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Otpverification()));
                      })),
                ]),
          ),
        ),
      ),
    );
  }
}
