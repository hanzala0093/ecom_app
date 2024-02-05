import 'package:ecommerce_app/common/widgets/brands/brand_showcase.dart';
import 'package:ecommerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Brands
                  const TBrandShowCase(
                    images: [
                      TImages.productImage1,
                      TImages.productImage2,
                      TImages.productImage3,
                    ],
                  ),
                  const TBrandShowCase(
                    images: [
                      TImages.productImage1,
                      TImages.productImage2,
                      TImages.productImage3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  //Products

                  TsectionHeading(title: 'You may like', onPressed: () {}),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TGridLayout(
                      itemCount: 4,
                      itemBuilder: (_, index) => const TProductCardVertical()),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              )),
        ]);
  }
}
