import 'package:ecommerce_app/common/widgets/images/t_brand_tite_with_verified_icon.dart';
import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/common/widgets/products/rounded_container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class TproductMetaData extends StatelessWidget {
  const TproductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & sales
        Row(
          children: [
            //Sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            //Price

            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const TProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        //Title
        const TProductTitleText(title: 'Green Nike T shirt'),
        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),

        //Stock status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems / 1.5,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems / 1.5,
        ),
        //Brand

        Row(
          children: [
            TCircularImag(
                width: 32,
                height: 32,
                overLayColor: darkMode ? TColors.white : TColors.black,
                image: TImages.shoeIcon),
            const BrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSized: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
