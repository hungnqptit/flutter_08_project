import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Text("Signup"),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Back"))
      ],
    )));
  }
}
