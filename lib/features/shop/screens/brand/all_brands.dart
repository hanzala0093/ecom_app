import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/product_cart/brand_card.dart';
import 'package:ecommerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const TsectionHeading(
                title: 'Brand',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //Brands
              TGridLayout(
                  mainAxisExtent: 80,
                  itemCount: 8,
                  itemBuilder: (context, index) => TBrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
