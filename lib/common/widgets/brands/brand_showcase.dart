import 'package:ecommerce_app/common/widgets/product_cart/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../products/rounded_container/rounded_container.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: Colors.transparent,
      borderColor: TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const TBrandCard(
            showBorder: false,
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          //Brand top 3 products

          Row(
            children: images
                .map((image) => brandTopProductImages(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImages(String image, context) {
  return Expanded(
      child: TRoundedContainer(
    height: 100,
    padding: const EdgeInsets.all(TSizes.md),
    backgroundColor:
        THelperFunctions.isDarkMode(context) ? TColors.grey : TColors.light,
    margin: const EdgeInsets.only(right: TSizes.sm),
    child: Image(image: AssetImage(image)),
  ));
}
