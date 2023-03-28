import 'package:flutter/material.dart';
import 'color.dart';

class AuthTextField extends StatelessWidget {
  final control;
  final String hint;
  final bool obsecure;
  final Color background;

  const AuthTextField({
    super.key,
    required this.hint,
    required this.obsecure,
    this.control,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        style: const TextStyle(fontFamily: "product", fontSize: 16),
        controller: control,
        obscureText: obsecure,
        maxLines: 1,
        decoration: InputDecoration(
          fillColor: background,
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500], fontFamily: "product"),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
