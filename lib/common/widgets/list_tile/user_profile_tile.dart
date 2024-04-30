
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/features/personalization/screens/profile/profile.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';

import '../../../utils/constants/colors.dart';

class UUserProfileTile extends StatelessWidget {
  const UUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UCircularImage(
        image: UImages.user,
        width: 50,height: 50,
        padding: 0,
      ),
      title: Text('M Usama',style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white),),
      subtitle: Text('m.usama@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.white),),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileScreen()),icon: const Icon(Iconsax.edit,color: UColors.white,),
      ),
    );
  }
}
