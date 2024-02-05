import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/custom_shapes/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TcurveEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          //Main Large Image
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(image: AssetImage(TImages.productImage1))),
                )),

            //Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: TSizes.spaceBtwItems),
                    itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => TRoundedImage(
                        width: 80,
                        backgroudColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imgUrl: TImages.productImage3)),
              ),
            ),
            //AppBar Icon
            const TAppbar(
              showBackArrow: true,
              action: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
