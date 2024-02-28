import 'package:agromate/Screens/Login.dart';
import 'package:agromate/const/firebase_const.dart';
import 'package:agromate/services/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuthservices auth = FirebaseAuthservices();
  var controller = Get.put(FirebaseAuthservices());
  var emailcontroller = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();
  bool ischeck = false;

  @override
  void dispose() {
    nameController.dispose();
    emailcontroller.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/signup.png"),
              backgroundColor:
                  Colors.transparent, // Ensure transparent background
              child: Container(
                width: 200,
                height: 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      100), // Ensure border radius matches the CircleAvatar's radius
                ),
              ),
            ),
            Center(
              child: Text("Sign Up",
                  style: TextStyle(
                    color: Color(0xFF717302),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.5),
                  ),
                  hintText: "Full Name",
                ),
              ),
            ),
            15.heightBox,
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
                  hintText: "Email",
                ),
              ),
            ),
            15.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.5),
                    ),
                    hintText: "Password",
                    suffixIcon: Icon(Icons.lock_open_rounded)),
              ),
            ),
            0.heightBox,
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    "I agree to terms and conditions",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.5), // Adjust the font size as needed
                  ),
                  8.heightBox,
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 13.5, right: 10.5),
                child: Container(
                  color: Color(0xFFBADBC2),
                  width: MediaQuery.of(context).size.width * .92,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        controller.isLoading(true);
                        await controller
                            .signupWithEmailandPassword(
                                emailcontroller.text, passwordController.text)
                            .then((value) {
                          return controller.storeuserdata(
                              name: nameController.text,
                              password: passwordController.text,
                              email: emailcontroller.text);
                        }).then((value) {
                          VxToast.show(context, msg: "User has created");
                          Get.to(() => LoginScreen());
                        });
                      } catch (e) {
                        VxToast.show(context, msg: e.toString());
                        controller.isLoading(false);
                      }
                    },
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 28),
                      ),
                    ),
                  ),
                )),
            8.heightBox,
            Text(
              "Already have an account? Login",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.5), // Adjust the font size as needed
            ),
            27.heightBox,
            Text("Signup with",
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w400,
                )),
            15.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Align the CircleAvatars evenly within the row
              children: [
                CircleAvatar(
                  child: SvgPicture.asset("assets/google.svg"),
                  radius: 23,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  child: SvgPicture.asset("assets/phone.svg"),
                  radius: 23,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  child: SvgPicture.asset("assets/google.svg"),
                  radius: 23,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void signup() async {
    String email = emailcontroller.text;
    String password = passwordController.text;

    User? user = await auth.signupWithEmailandPassword(email, password);
    if (user != null) {
      print("user is succesfully created");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      print("some error occured");
    }
  }
}
