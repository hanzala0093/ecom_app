import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onselected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onselected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: THelperFunctions.getColor(text) != null
          ? const SizedBox()
          : Text(text),
      selected: selected,
      onSelected: onselected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      avatar: THelperFunctions.getColor(text) != null
          ? TCircularContanier(
              width: 50,
              height: 50,
              backgroundColor: THelperFunctions.getColor(text)!)
          : null,
      shape:
          THelperFunctions.getColor(text) != null ? const CircleBorder() : null,
      labelPadding: THelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,
      padding: THelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,

      // ignore: prefer_null_aware_operators
      backgroundColor: THelperFunctions.getColor(text) != null
          ? THelperFunctions.getColor(text)!
          : null,
    );
  }
}
