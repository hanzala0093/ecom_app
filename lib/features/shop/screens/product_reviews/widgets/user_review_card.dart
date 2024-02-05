import 'package:ecommerce_app/common/widgets/products/Rating/rating_indicator.dart';
import 'package:ecommerce_app/common/widgets/products/rounded_container/rounded_container.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserCardReview extends StatelessWidget {
  const UserCardReview({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'Jhon Dee',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        //Reviews

        Row(
          children: [
            const TRatingBarINdicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 june, 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        const ReadMoreText(
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s ',
          trimLines: 1,
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          trimCollapsedText: 'Show more',
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          trimMode: TrimMode.Line,
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        //Company reply
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gruchee',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '04 july, 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const ReadMoreText(
                  'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s ',
                  trimLines: 1,
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  trimCollapsedText: 'Show more',
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  trimMode: TrimMode.Line,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
