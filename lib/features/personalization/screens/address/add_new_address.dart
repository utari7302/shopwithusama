import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(
        title: Text('Add new Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(width: USizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),
                      ),
                    ),
                    const SizedBox(height: USizes.spaceBtwInputFields,),
                  ],
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'City'),
                      ),
                    ),
                    const SizedBox(width: USizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),
                      ),
                    ),
                    const SizedBox(height: USizes.spaceBtwInputFields,),
                  ],
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),
                ),
                const SizedBox(height: USizes.defaultSpace,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
