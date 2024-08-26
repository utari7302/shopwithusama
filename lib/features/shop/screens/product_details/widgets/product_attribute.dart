import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/chips/choice_chip.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/products/product_cards/product_price_text.dart';
import 'package:shopwithusama/common/widgets/text/product_title_text.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/shop/controllers/product/variation_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../models/product.dart';

class UProductAttribute extends StatelessWidget {
  const UProductAttribute({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(

        children: [
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            URoundedContainer(
              padding: const EdgeInsets.all(USizes.md),
              backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title, Price and Stock Status
                  Row(
                    children: [
                      const USectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: USizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const UProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                const SizedBox(
                                  width: USizes.spaceBtwItems,
                                ),

                              /// Sale Price
                              UProductPriceText(
                                  price: controller.getVariationPrice())
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const UProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  /// Variation Description
                  UProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: USizes.spaceBtwItems,
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        USectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: USizes.spaceBtwItems / 2,
                        ),
                        Obx(
                          () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                return UChoiceChip(
                                    text: attributeValue,
                                    selected: isSelected,
                                    onSelected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList()),
                        )
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
