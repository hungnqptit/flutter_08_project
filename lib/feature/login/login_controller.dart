import 'package:flutter/material.dart';
import 'package:flutter_08_project/feature/home/home_arguments.dart';
import 'package:flutter_08_project/models/login_response.dart';
import 'package:flutter_08_project/network/apis/login_apis.dart';
import 'package:flutter_08_project/router/router.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showPassword = false.obs;

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }

  void onChangeUsername(username) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(username) {
    if (!GetUtils.isUsername(username)) {
      return "Username khong hop le";
    }
    return null;
    // if ((username ?? '').isEmpty) {
    //   return 'Username không được để trống';
    // } else if ((username ?? '').contains(' ')) {
    //   return 'Username không được có dấu cách';
    // } else {
    //   return null;
    // }
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

  // void onSubmit() {
  //   if ((user1.text != 'nguyendao') || (user2.text != '123456')) {
  //     Get.dialog(
  //       Dialog(
  //         child: Padding(
  //           padding: const EdgeInsets.all(8),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const Text(
  //                 'Thông tin đăng nhập không đúng, vui lòng nhập lại',
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   // Navigator.pop(context);
  //                 },
  //                 child: const Text('Close'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if ((user1.text == 'nguyendao') && (user2.text == '123456')) {
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => const Sceen3()));
  //   }
  // }

  onSubmitLogin() async {
    final LoginResponseModel? response = await LoginApi().login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (response != null) {
      Get.toNamed(
        AppRouterNamed.homepage,
        arguments: HomeArguments(
          username: emailController.text,
          password: passwordController.text,
        ),
      );
    } else {
      Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Thông tin đăng nhập không đúng, vui lòng nhập lại',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
