import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/custom_shapes/containers/primary_header_contanier.dart';
import 'package:ecommerce_app/common/widgets/listTile/setting_menu_tile.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/address/address.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/features/shop/screens/order/order_screen.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/listTile/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderWidget(
                child: Column(
              children: [
                //App bar
                TAppbar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                //User Profile
                TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            //body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Setting
                  const TsectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'MY Address',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'MY Cart',
                    subTitle: 'Add or remove products',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'MY Order',
                    subTitle: 'In progress and Ccompleted orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Address',
                    subTitle: 'List of all discounted coupens',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set Shopping Delivery Address',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: () {},
                  ),
                  //App setting

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TsectionHeading(
                    title: 'App settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load data',
                    subTitle: 'Upload data to your cloud storage',
                    onTap: () {},
                  ),

                  TSettingMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recomendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search Result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
