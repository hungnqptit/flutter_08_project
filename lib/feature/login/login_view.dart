import 'package:flutter/material.dart';
import 'package:flutter_08_project/feature/login/login_controller.dart';
import 'package:flutter_08_project/router/router.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // user name
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: 'Username',
                      ),
                      onChanged: controller.onChangeUsername,
                      validator: controller.validatorUsername,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: !controller.showPassword.value,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: controller.showHidePassword,
                            child: Icon(controller.showPassword.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onChanged: controller.onChangePassword,
                        validator: controller.validatorPassword,
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // button login
                    Center(
                      child: ElevatedButton(
                        onPressed: controller.onSubmitLogin,
                        child: const Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRouterNamed.signUp);
                        },
                        child: const Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => (controller.isLoading.value)
                ? Container(
                    color: Colors.black.withOpacity(0.8),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
