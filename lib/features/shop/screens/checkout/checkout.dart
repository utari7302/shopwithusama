import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/products/cart/coupon_widget.dart';
import 'package:shopwithusama/common/widgets/success_screen/success_screen.dart';
import 'package:shopwithusama/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopwithusama/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shopwithusama/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shopwithusama/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: UAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              /// Items in cart
              const UCartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Coupon TextField

              const UCouponCode(),
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Billing Section
              URoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: dark ? UColors.black : UColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    UBillingAmountSection(),
                    SizedBox(
                      height: USizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: USizes.spaceBtwItems,
                    ),

                    /// Payment Method
                    UBillingPaymentSection(),
                    SizedBox(
                      height: USizes.spaceBtwItems,
                    ),

                    /// Address
                    UBillingAddressSection(),
                    SizedBox(
                      height: USizes.spaceBtwItems,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: UImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
