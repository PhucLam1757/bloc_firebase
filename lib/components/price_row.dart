import "package:flutter_bloc_restapi_firebase/widget/custom_text.dart";

import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.saleOffPrice,
    required this.originalPrice,
  }) : super(key: key);

  final int? saleOffPrice;
  final int? originalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: '\$${saleOffPrice ?? originalPrice}',
          fontWeight: FontWeight.w900,
          size: 18,
        ),
        const SizedBox(width: 10),
        if (saleOffPrice != null)
          CustomText(
            text: '\$$originalPrice',
            lineThrough: true,
          ),
      ],
    );
  }
}
