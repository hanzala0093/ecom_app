import 'package:ecommerce_app/common/widgets/products/rounded_container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/success_screen.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/cart/coupan_widgets.dart';
import '../../../../utils/constants/colors.dart';
import '../cart/widgets/cart_items.dart';
import 'widgets/billing_address_section.dart';

class CheckOutScren extends StatelessWidget {
  const CheckOutScren({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              const TCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Coupens
              const TCoupanCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Billing sections
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //Divider

                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    //Payment Method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    //Address Section

                    TBillingAddressSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success',
                subTitle: 'Your Item will be shipped soon',
                onPressed: () => Get.offAll(() => const NavigationMenu()))),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
