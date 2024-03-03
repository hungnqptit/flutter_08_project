import 'package:flutter/material.dart';
import 'package:flutter_08_project/feature/login/login_binding.dart';
import 'package:flutter_08_project/feature/login/login_view.dart';
import 'package:flutter_08_project/router/router.dart';

import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: LoginBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRouter.routes,
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}
