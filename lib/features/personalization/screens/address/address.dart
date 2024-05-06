import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/features/personalization/screens/address/add_new_address.dart';
import 'package:shopwithusama/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(()=> const AddNewAddressScreen()),
        backgroundColor: UColors.primary,
        child: const Icon(Iconsax.add,color: Colors.white,),
      ),
      appBar: UAppBar(
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              USingleAddress(selectedAddress: true,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
              USingleAddress(selectedAddress: false,),
            ],
          ),
        ),
      ),
    );
  }
}
