import 'package:ecommerce_app/common/widgets/form_divider.dart';
import 'package:ecommerce_app/common/widgets/social_buttons.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 24),
        child: Column(
          children: [
            //logo title
            TLoginHeader(dark: dark),
            //Form
            const TLoginForm(),

            TFormDivider(
              dark: dark,
              dividerText: TTexts.orSignInWith.capitalize!,
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //Footer
            const TSocialButtons()
          ],
        ),
      )),
    );
  }
}
