import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ThomeAppBar extends StatelessWidget {
  const ThomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            () => Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ),
          )
        ],
      ),
      action: [
        TcartCouncterIcon(
          onpressed: () {},
          iconColor: TColors.white,
        )
      ],
    );
  }
}
