import 'package:ecommerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),

              //Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      ),
                      prefixIcon: const Icon(Iconsax.password_check)),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),

              //Remember me forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember me
                  Row(
                    children: [
                      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (Value) => controller.rememberMe.value =
                                !controller.rememberMe.value),
                      ),
                      const Text(TTexts.rememberMe)
                    ],
                  ),
                  TextButton(
                      onPressed: () => Get.to(() => const ForgetPassword()),
                      child: const Text(TTexts.forgetPassword)),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              //Sign in button

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => controller.emailAndPasswordSignin()),
                      child: const Text(TTexts.signIn))),

              //Create Account button
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      //Getx
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(TTexts.createAccount))),
            ],
          ),
        ));
  }
}
