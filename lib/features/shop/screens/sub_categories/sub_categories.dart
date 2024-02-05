import 'package:ecommerce_app/common/widgets/images/t_rounded_images.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizentol.dart';

class SubCatogoriesScreen extends StatelessWidget {
  const SubCatogoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const TRoundedImage(
                imgUrl: TImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //Sub Categories
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TsectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const TProductCardHorizentol()),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  // Double Categories
                  TsectionHeading(
                    title: 'Sports Trousers',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            const TProductCardHorizentol()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
