import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:shopwithusama/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmer/shimmer.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const UAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : UImages.user;
                        return controller.imageUploading.value
                            ? const UShimmerEffect(
                                width: 80,
                                height: 80,
                                radius: 80,
                              )
                            : UCircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: USizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),
              const USectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              UProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              UProfileMenu(
                title: 'Username',
                value: controller.user.value.email,
                onPressed: () {},
              ),

              const SizedBox(
                height: USizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              const USectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              UProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'Date of Birth',
                value: '7 Dec 1999',
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
