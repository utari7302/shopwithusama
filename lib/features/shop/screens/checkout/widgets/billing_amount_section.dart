import 'package:flutter/material.dart';
import 'package:shopwithusama/features/shop/controllers/product/cart_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/pricing_calculator.dart';

class UBillingAmountSection extends StatelessWidget {
  const UBillingAmountSection({super.key});
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 2,),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${UPricingCalculator.calculateShippingCost(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 2,),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${UPricingCalculator.calculateTax(subTotal, 'US')}', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 2,),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${UPricingCalculator.calculateTotalPrice(subTotal, 'US')}', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

      ],
    );
  }
}
