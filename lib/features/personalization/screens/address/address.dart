import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Address'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              TSingleAddress(
                selectedAddress: false,
              ),
              TSingleAddress(
                selectedAddress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
