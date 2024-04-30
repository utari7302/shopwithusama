import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const UCircularImage(
                      image: UImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
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
                value: 'Muhammad Usama',
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'Username',
                value: 'm_usama',
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
                value: '45689',
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'E-mail',
                value: 'm_usama@gmail.com',
                onPressed: () {},
              ),
              UProfileMenu(
                title: 'Phone Number',
                value: '+92-3214846448',
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
                    onPressed: () {},
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
