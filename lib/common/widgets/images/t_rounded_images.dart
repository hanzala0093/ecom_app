import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroudColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onpressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroudColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onpressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroudColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imgUrl)
                  : AssetImage(imgUrl) as ImageProvider),
        ),
      ),
    );
  }
}
