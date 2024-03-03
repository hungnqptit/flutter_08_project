import 'package:flutter_08_project/feature/home/home_binding.dart';
import 'package:flutter_08_project/feature/login/login_binding.dart';
import 'package:flutter_08_project/feature/login/login_view.dart';
import 'package:flutter_08_project/feature/home/home_view.dart';
import 'package:flutter_08_project/signup.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    // Login
    GetPage(
      name: AppRouterNamed.login,
      page: () => const LoginPage(
        title: '',
      ),
      binding: LoginBinding(),
    ),
    // Signup
    GetPage(
      name: AppRouterNamed.signUp,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: AppRouterNamed.homepage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}

class AppRouterNamed {
  static const login = '/';
  static const signUp = '/signup';
  static const homepage = '/home';
}
