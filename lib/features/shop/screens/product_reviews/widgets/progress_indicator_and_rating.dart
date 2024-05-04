import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/device/device_utility.dart';

class URatingProgressIndicator extends StatelessWidget {
  const URatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text,style: Theme.of(context).textTheme.bodyMedium,)),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: UDeviceUtility.getScreenWidth(context) * 0.8,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: UColors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor: const AlwaysStoppedAnimation(UColors.primary),
              ),
            )
        )
      ],
    );
  }
}