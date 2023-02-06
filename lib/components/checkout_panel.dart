import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/device_parameters.dart';
import "package:flutter_bloc_restapi_firebase/widget/custom_text.dart";
import "package:flutter_bloc_restapi_firebase/widget/round_button.dart";

class CheckOutPanel extends StatelessWidget {
  const CheckOutPanel({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceParameters.screenHeight(context) / 7.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: 'Total', size: 20),
              ],
            ),
            RoundButton(
              onPressed: onPressed,
              height: 50,
              borderRadius: 20,
              text: 'Buy Now',
              buttonColor: Colors.deepOrange,
              textColor: Colors.white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
