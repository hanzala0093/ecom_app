import 'package:ecommerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    this.color,
    required this.title,
    required this.maxLines,
    this.textAlign,
    required this.brandTextSized,
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSized;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: brandTextSized == TextSizes.small
                ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
                : brandTextSized == TextSizes.medium
                    ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                    : brandTextSized == TextSizes.large
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: color)
                        : Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: color)),
      ],
    );
  }
}
