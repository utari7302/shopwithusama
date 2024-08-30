import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/common/widgets/text/u_brand_title_text_with_verification_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/enums.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../features/shop/models/brand_model.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });

  final bool showBorder;
  final void Function()? onTap;
  final BrandModel  brand;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: UCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? UColors.white : UColors.black,
              ),
            ),
            const SizedBox(width: USizes.spaceBtwItems / 2,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UBrandTitleWithVerification(title: brand.name,brandTextSize: TextSizes.large,),
                  Text('${brand.productsCount ?? 0} products',overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.labelMedium,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}