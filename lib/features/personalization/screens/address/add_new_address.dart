import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/features/personalization/controllers/address_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: const UAppBar(
        title: Text('Add new Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => UValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: UValidator.validatePhoneNumber,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => UValidator.validateEmptyText('Street', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(width: USizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => UValidator.validateEmptyText('Postal Code', value),
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
                        controller: controller.city,
                        validator: (value) => UValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'City'),
                      ),
                    ),
                    const SizedBox(width: USizes.spaceBtwInputFields,),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => UValidator.validateEmptyText('State', value),
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),
                      ),
                    ),
                    const SizedBox(height: USizes.spaceBtwInputFields,),
                  ],
                ),
                const SizedBox(height: USizes.spaceBtwInputFields,),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => UValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),
                ),
                const SizedBox(height: USizes.defaultSpace,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddresses(),
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
