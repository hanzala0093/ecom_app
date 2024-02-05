import 'package:ecommerce_app/common/widgets/app_bar/appbar.dart';
import 'package:ecommerce_app/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/change_name.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../data/repositories/authencation_repositories.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController.instance;
    return Scaffold(
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImag(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change profile Picture')),
                  ],
                )),
            //Detials
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const TsectionHeading(
              title: 'Profile Information',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            TProfileMenu(
              title: 'Name',
              value: controller.user.value.fullName,
              onPressed: () => Get.to(() => const ChangeName()),
            ),
            TProfileMenu(
              title: 'UserName',
              value: controller.user.value.userName,
              onPressed: () {},
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Divider(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            //Personal Info

            const TsectionHeading(
              title: 'Personal Information',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TProfileMenu(
              title: 'User Id',
              value: controller.user.value.id,
              icon: Iconsax.copy,
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'E-mail',
              value: controller.user.value.email,
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'Phone No#',
              value: controller.user.value.phoneNumber,
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'Gender',
              value: 'Male',
              onPressed: () {},
            ),
            TProfileMenu(
              title: 'Date of Birth',
              value: '3 Feb , 2024',
              onPressed: () {},
            ),

            Center(
              child: TextButton(
                  onPressed: () => AnthenticationRepository.instance.logout(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
