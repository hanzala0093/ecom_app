import 'package:ecommerce_app/features/shop/screens/sub_categories/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widget/vertical_images_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 9,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TverticalImagesText(
              image: TImages.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => const SubCatogoriesScreen()),
            );
          }),
    );
  }
}
