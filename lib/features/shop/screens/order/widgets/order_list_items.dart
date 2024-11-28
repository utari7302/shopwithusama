import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/loaders/animation_loader.dart';
import 'package:shopwithusama/features/shop/controllers/product/order_controller.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/cloud_helper_function.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          /// Nothing found widget
          final emptyWidget = UAnimationLoaderWidget(
              text: 'Whoops! No Orders Yet!',
              animation: UImages.docerAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: ()=> Get.off(()=> const NavigationMenu()),
          );

          /// Helper function: Handle Loader, No Record, Or Error Message
          final  response = UCloudHelperFunction.checkMultiRecordState(snapshot: snapshot,nothingFound: emptyWidget);
          if(response!=null) return response;

          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwItems,),
            itemBuilder: (_, index) {
              final order = orders[index];
              return URoundedContainer(
                padding: const EdgeInsets.all(USizes.md),
                showBorder: true,
                backgroundColor: dark ? UColors.dark : UColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        /// Image
                        const Icon(Iconsax.ship),
                        const SizedBox(width: USizes.spaceBtwItems/2,),

                        /// Status & Date
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(order.orderStatusText,style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary,fontWeightDelta: 1),),
                              Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall,)
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
                                    Text(order.id,style: Theme.of(context).textTheme.titleMedium,)
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
                                    Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium,)
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
              );
            },


          );
        },
    );
  }
}
