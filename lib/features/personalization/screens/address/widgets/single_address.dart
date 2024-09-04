import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/features/personalization/controllers/address_controller.dart';
import 'package:shopwithusama/features/personalization/models/address_model.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = UHelperFunctions.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;
        return InkWell(
          onTap: onTap,
          child: URoundedContainer(
            padding: const EdgeInsets.all(USizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress ? UColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor: selectedAddress ? Colors.transparent : dark ? UColors.darkerGrey :UColors.grey,
            margin: const EdgeInsets.only(bottom: USizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress ? dark ? UColors.light : UColors.dark.withOpacity(0.6) : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name,maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: USizes.sm / 2,),
                    Text(address.formattedPhoneNo,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: USizes.sm / 2,),
                    Text(address.toString(),softWrap: true,),

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
