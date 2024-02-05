import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$256',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        //Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$399',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        //Tax fee

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$2',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),

        //Order Total

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$446',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}
