import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(UImages.userProfileImage1),),
                const SizedBox(width: USizes.spaceBtwItems,),
                Text('M Usama',style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.more_vert)),
          ],
        ),

        const SizedBox(height: USizes.spaceBtwItems,),

        /// Reviews
        Row(
          children: [
            const URatingBarIndicatior(rating: 4),
            const SizedBox(width: USizes.spaceBtwItems,),
            Text('01 Nov, 2023',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems,),

        const ReadMoreText(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: UColors.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: UColors.primary),
        ),
        const SizedBox(height: USizes.spaceBtwItems,),

        /// Company reviews
        URoundedContainer(
          backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(USizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('T\'s store',style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Nov, 2023',style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: USizes.spaceBtwItems,),

                const ReadMoreText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: UColors.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: UColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: USizes.spaceBtwSections,)
      ],
    );
  }
}
