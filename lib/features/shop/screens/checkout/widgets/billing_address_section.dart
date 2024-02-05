import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TsectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'change',
          onPressed: () {},
        ),
        Text(
          'Muhammad Hanzala',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 12,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '03214229408',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 12,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '34/D askri 9 zarar saheed road Lahore',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            )
          ],
        ),
      ],
    );
  }
}
