import 'package:flutter/material.dart';
import 'package:gjustit3/common/color.dart';
import 'package:gjustit3/pages/auth/login.dart';

import '../../common/authTextField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: "product",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 50),
                  //username
                  AuthTextField(
                    control: username,
                    background: Colors.white,
                    hint: "username@email.com",
                    obsecure: false,
                  ),
                  const SizedBox(height: 25),
                  //password
                  AuthTextField(
                    control: password,
                    background: Colors.white,
                    hint: "* * * * * * *",
                    obsecure: true,
                  ),
                  const SizedBox(height: 25),
                  //Confirm password
                  AuthTextField(
                    control: cpassword,
                    background: Colors.white,
                    hint: " * * * * * * * * ",
                    obsecure: true,
                  ),
                  //button
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: const Text("please sign in"),
                        action: SnackBarAction(label: 'ok', onPressed: () {}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "product",
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "already a member ? ",
                        style: TextStyle(
                            color: AppColor.black,
                            fontFamily: "product",
                            fontSize: 15),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (contetx) => const LoginScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            " sign in",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: "product",
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
