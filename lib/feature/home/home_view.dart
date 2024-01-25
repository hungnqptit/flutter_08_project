import 'package:flutter/material.dart';
import 'package:flutter_08_project/feature/home/home_arguments.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments as HomeArguments;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home"),
            Text("Xin chao ${argument.username}"),
          ],
        ),
      ),
    );
  }
}
