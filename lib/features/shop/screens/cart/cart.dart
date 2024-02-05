// ignore_for_file: unused_import, unnecessary_const

import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/t_circular_icon.dart';
import 'package:ecommerce_app/common/widgets/images/t_rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/images/t_brand_tite_with_verified_icon.dart';
import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';
import '../checkout/checkout.dart';
import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace), child: TCartItems()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckOutScren()),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
