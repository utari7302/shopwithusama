import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/features/personalization/controllers/update_name_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),

            /// Form
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => UValidator.validateEmptyText('First Name',value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: UTexts.firstName),
                  ),
                  const SizedBox(
                    height: USizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => UValidator.validateEmptyText('Last Name',value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: UTexts.lastName),
                  ),

                ],
              ),),
            const SizedBox(
              height: USizes.spaceBtwSections,
            ),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text('Save')),
            ),

          ],
        ),
      ),
    );
  }
}
