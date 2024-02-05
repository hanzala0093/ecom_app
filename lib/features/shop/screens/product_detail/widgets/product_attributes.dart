import 'package:ecommerce_app/common/widgets/products/rounded_container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductSttributes extends StatelessWidget {
  const TProductSttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //Selected Attributes Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              //Title price and stock
              Row(
                children: [
                  const TsectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //actual Price
                        children: [
                          const TProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          //Sale Price
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      //Stock
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              //Variation Description
              const TProductTitleText(
                title:
                    'This is the description of product upto maximum 4 lines',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        //Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TsectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onselected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  selected: false,
                  onselected: (value) {},
                ),
                TChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onselected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TsectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'EU 34',
                  selected: true,
                  onselected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 36',
                  selected: false,
                  onselected: (value) {},
                ),
                TChoiceChip(
                  text: 'EU 38',
                  selected: false,
                  onselected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
