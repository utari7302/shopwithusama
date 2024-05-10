import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwItems,),
        itemBuilder: (_, index) => URoundedContainer(
          padding: const EdgeInsets.all(USizes.md),
          showBorder: true,
          backgroundColor: dark ? UColors.dark : UColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.ship),
                  const SizedBox(width: USizes.spaceBtwItems/2,),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary,fontWeightDelta: 1),),
                        Text('07 Nov,2024',style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),

                  IconButton(onPressed: () {

                  }, icon: const Icon(Iconsax.arrow_right_34,size: USizes.iconSm,),)
                ],
              ),

              const SizedBox(height: USizes.spaceBtwItems,),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.tag),
                        const SizedBox(width: USizes.spaceBtwItems/2,),
                    
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',style: Theme.of(context).textTheme.labelMedium,),
                              Text('[#256f2]',style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: USizes.spaceBtwItems/2,),
                    
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',style: Theme.of(context).textTheme.labelMedium,),
                              Text('3 Feb 2025',style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),


    );
  }
}
