import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/features/shop/screens/order/widgets/order_list_items.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        title: Text('My Order',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(USizes.defaultSpace),
        child: UOrderListItems(),
      )
    );
  }
}
