import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/features/personalization/controllers/address_controller.dart';
import 'package:shopwithusama/features/personalization/screens/address/add_new_address.dart';
import 'package:shopwithusama/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../utils/helpers/cloud_helper_function.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Obx(
            () =>  FutureBuilder(
              // Use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.allUserAddresses(),
              builder: (context, snapshot) {

                /// Handle Loader, No Record, OR Error Message
                final response = UCloudHelperFunction.checkMultiRecordState(
                    snapshot: snapshot);
                if (response != null) return response;

                /// Record Found
                final addresses = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => USingleAddress(address: addresses[index],onTap: () => controller.selectAddress(addresses[index]))
                );


              }
            ),
          ),
        ),
      ),
    );
  }
}
