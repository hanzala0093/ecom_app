import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/appbar.dart';
import 'widgets/order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar

      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        //Orders
        child: TOrderListItems(),
      ),
    );
  }
}
