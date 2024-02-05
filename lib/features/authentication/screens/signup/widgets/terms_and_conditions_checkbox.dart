import 'package:ecommerce_app/features/authentication/controllers/sign_up/signup_controller.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(() => Checkbox(
                value: controller.privacyPoliecy.value,
                onChanged: (value) => controller.privacyPoliecy.value =
                    !controller.privacyPoliecy.value))),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '${TTexts.iAgreeTo} ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: '${TTexts.privacyPolicy} ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColors.white : TColors.primary),
          ),
          TextSpan(
            text: '${TTexts.and} ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: TTexts.termsOfUse,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: dark ? TColors.white : TColors.primary),
          ),
        ]))
      ],
    );
  }
}
