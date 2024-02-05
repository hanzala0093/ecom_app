import 'package:ecommerce_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TsignupForm extends StatelessWidget {
  const TsignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  //First Name
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwInputFields,
                ),
                Expanded(
                  child: TextFormField(
                    //Last Name
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Username
            TextFormField(
              validator: (value) =>
                  TValidator.validateEmptyText('User Name', value),
              controller: controller.userName,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            //Phone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
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
              height: TSizes.spaceBtwInputFields,
            ),
            //Terms and conditions
            TermsAndConditions(dark: dark),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //SignUp Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(TTexts.createAccount)),
            )
          ],
        ));
  }
}
