
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/common/widgets/images/u_circular_image.dart';
import 'package:shopwithusama/features/personalization/controllers/user_controller.dart';
import 'package:shopwithusama/features/personalization/screens/profile/profile.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/shimmer/shimmer.dart';

class UUserProfileTile extends StatelessWidget {
  const UUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
            () {
          final networkImage =
              controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty
              ? networkImage
              : UImages.user;
          return controller.imageUploading.value
              ? const UShimmerEffect(
            width: 50,
            height: 50,
            radius: 50,
          )
              : UCircularImage(
            image: image,
            width: 50,
            height: 50,
            isNetworkImage: networkImage.isNotEmpty,
          );
        },
      ),
      title: Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.white),),
      trailing: IconButton(
        onPressed: () => Get.to(() => const ProfileScreen()),icon: const Icon(Iconsax.edit,color: UColors.white,),
      ),
    );
  }
}
