import 'package:ecommerce_app/common/widgets/images/t_brand_title_text.dart';
import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.iconColor = TColors.primary,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSized = TextSizes.small,
  });

  final Color? textColor, iconColor;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSized;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSized: brandTextSized,
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: TColors.primary,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
