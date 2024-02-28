import 'package:agromate/Screens/ForgotPass.dart';
import 'package:agromate/Screens/abc.dart';
import 'package:agromate/Screens/signup.dart';
import 'package:agromate/services/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(FirebaseAuthservices());
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  final isgoogleloading = false.obs;

  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void initState() {
    // readLocalJson();
    super.initState();
  }

  String image1 = "assets/google.svg";
  String image2 = "assets/phone.svg";
  String image3 = "assets/leaf-r.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Color.fromARGB(255, 78, 110, 27),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/leaf-r.png',
                  width: 266.3,
                  height: 360,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.5),
                  ),
                  hintText: "Username or email",
                ),
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.5),
                  ),
                  hintText: "Password",
                ),
              ),
            ),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPass()),
                    );
                  },
                  child: "Forgot Password".text.color(Colors.black).make(),
                )
              ],
            ),
            6.5.heightBox,
            Padding(
                padding: const EdgeInsets.only(left: 13.5, right: 10.5),
                child: Container(
                  width: MediaQuery.of(context).size.width * .85,
                  color: Color.fromARGB(224, 162, 220, 192),
                  child: ElevatedButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      await controller
                          .signInWithEmailAndPassword(
                              emailcontroller.text, passwordcontroller.text)
                          .then((value) {
                        if (value != null) {
                          VxToast.show(context, msg: "loginsuccesfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPass()));
                        } else {
                          controller.isLoading(false);
                        }
                      });
                    },
                    child: Text(
                      "Login",
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
                )),
            2.3.heightBox,
            Center(
              child: GestureDetector(
                  onTap: () {
                    Get.off(() => SignUpScreen());
                  },
                  child: Text(
                    "Don't have an account? Create One",
                    style: TextStyle(color: Colors.red),
                  )),
            ),
            3.heightBox,
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            buttonItem(context, image1, 'Signing Using Google', 29, () {
              googleSignIn();
            }),
            buttonItem(context, image2, 'Signing Using Mobile', 29, () {}),
          ],
        ),
      ),
    );
  }

  Future<void> googleSignIn() async {
    try {
      isgoogleloading.value = true;
      await controller.signInwithgoogle();
      isgoogleloading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }
}

Widget buttonItem(
  context,
  String imglink,
  String text,
  double size,
  onTap,
) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(),
        width: MediaQuery.of(context).size.width * 60,
        height: 60,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 60, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                1.5.widthBox,
                SvgPicture.asset(
                  imglink,
                  height: size,
                  width: size,
                ),
                30.widthBox,
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
