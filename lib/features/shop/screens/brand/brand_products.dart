import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/product_cart/brand_card.dart';
import 'package:ecommerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Brand Detials
              TBrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
