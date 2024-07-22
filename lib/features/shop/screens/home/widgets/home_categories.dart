import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:shopwithusama/features/shop/sub_categories/sub_categories.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (_, index) {
          return UVerticalImageText(
            image: UImages.shoeIcon,
            title: 'Shoes',
            onTap: () => Get.to(()=> const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}