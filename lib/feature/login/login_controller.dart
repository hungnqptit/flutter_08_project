import 'package:flutter/material.dart';
import 'package:flutter_08_project/feature/home/home_arguments.dart';
import 'package:flutter_08_project/models/login_request.dart';
import 'package:flutter_08_project/network/configs/data_state.dart';
import 'package:flutter_08_project/network/repositories/login_repository.dart';
import 'package:flutter_08_project/router/router.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showPassword = false.obs;
  final isLoading = false.obs;

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }

  void onChangeUsername(username) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(username) {
    if ((username ?? '').isEmpty) {
      return 'Username không được để trống';
    } else if ((username ?? '').contains(' ')) {
      return 'Username không được có dấu cách';
    } else {
      return null;
    }
  }

  void onChangePassword(password) {
    formKey.currentState?.validate();
  }

  String? validatorPassword(password) {
    if ((password ?? '').isEmpty) {
      return 'Password không được để trống';
    } else if ((password ?? '').contains(' ')) {
      return 'Password không được có dấu cách';
    } else {
      return null;
    }
  }

  onSubmitLogin() async {
    return Get.toNamed(
      AppRouterNamed.homepage,
      arguments: HomeArguments(
        username: emailController.text,
        password: passwordController.text,
      ),
    );
    final emailValue = emailController.text;
    final passwordValue = passwordController.text;

    final LoginRequest loginRequest = LoginRequest(
      email: emailValue,
      password: passwordValue,
    );
    isLoading.value = true;
    final loginReponseFromRepo = await LoginRepository().login(loginRequest);
    isLoading.value = false;
    if (loginReponseFromRepo is DataSuccess) {
      Get.toNamed(
        AppRouterNamed.homepage,
        arguments: HomeArguments(
          username: emailController.text,
          password: passwordController.text,
        ),
      );
    }
    if (loginReponseFromRepo is DataFailed) {
      _showErrorLoginDialog();
    }
  }

  Future<dynamic> _showErrorLoginDialog() {
    return Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Đã có lỗi xảy ra, vui lòng nhập lại',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
