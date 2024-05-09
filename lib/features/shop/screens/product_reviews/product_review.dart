import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shopwithusama/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shopwithusama/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text('Reviews & Rating',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from people who use the same type of device that you use'),
              const SizedBox(height: USizes.spaceBtwItems,),

              /// Overall product rating
              const UOverAllProductRating(),
              const URatingBarIndicatior(rating: 4.3,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: USizes.spaceBtwSections,),

              /// User reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}






