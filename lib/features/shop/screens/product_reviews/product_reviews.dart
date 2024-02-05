import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import '../../../../common/widgets/products/Rating/rating_indicator.dart';
import 'widgets/overall_product_rating.dart';
import 'widgets/user_review_card.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Reviews & Rating'),
        showBackArrow: true,
      ),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'rating and reviews are verified form peoples who buy or product'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //over all product Rating
              const TOverallProductRating(),
              const TRatingBarINdicator(
                rating: 3.5,
              ),
              Text(
                '2233',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //User Review List
              const UserCardReview(),
              const UserCardReview(),
              const UserCardReview(),
              const UserCardReview(),
            ],
          ),
        ),
      ),
    );
  }
}
