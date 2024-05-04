import 'package:flutter/material.dart';
import 'package:shopwithusama/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class UOverAllProductRating extends StatelessWidget {
  const UOverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.8',style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
            flex: 7,
            child: Column(
              children: [
                URatingProgressIndicator(text: '5',value: 1,),
                URatingProgressIndicator(text: '4',value: 0.8,),
                URatingProgressIndicator(text: '3',value: 0.6,),
                URatingProgressIndicator(text: '2',value: 0.4,),
                URatingProgressIndicator(text: '1',value: 0.2,),
              ],
            )
        )
      ],
    );
  }
}