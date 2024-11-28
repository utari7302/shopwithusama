import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/product/checkout_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark =UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        USectionHeading(title: 'Payment Method',buttonTitle: 'Change',onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: USizes.spaceBtwItems/2,),
        Obx(
          () => Row(
            children: [
              URoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? UColors.light : UColors.white,
                padding: const EdgeInsets.all(USizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              const SizedBox(height: USizes.spaceBtwItems/2,),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}
