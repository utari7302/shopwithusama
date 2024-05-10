import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(title: 'Shipping Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Muhammad Usama',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone,color: Colors.grey,size: 16,),
            const SizedBox(width: USizes.spaceBtwItems,),
            Text('+92-321-4846448',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.location_history,color: Colors.grey,size: 16,),
            const SizedBox(width: USizes.spaceBtwItems,),
            Expanded(child: Text('South Liana, Maine 87986, USA',style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
          ],
        )
      ],
    );
  }
}
