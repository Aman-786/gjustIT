import 'package:flutter/material.dart';
import 'package:gjustit3/common/color.dart';
import 'package:gjustit3/pages/Home.dart';
import 'package:gjustit3/pages/auth/signup.dart';
import '../../common/authTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            color: AppColor.white,
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
                    "Login",
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
                    background: AppColor.backgroundColor,
                    hint: "username@email.com",
                    obsecure: false,
                  ),
                  const SizedBox(height: 25),
                  //password
                  AuthTextField(
                    control: password,
                    background: AppColor.backgroundColor,
                    hint: "* * * * * * *",
                    obsecure: true,
                  ),
                  //button
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "product",
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // new member??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "new member ? ",
                        style: TextStyle(
                            color: AppColor.black,
                            fontFamily: "product",
                            fontSize: 15),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            " Register",
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
