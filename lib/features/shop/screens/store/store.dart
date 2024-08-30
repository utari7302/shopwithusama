import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/appbar/tabbar.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:shopwithusama/common/widgets/layouts/grid_layout.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shopwithusama/common/widgets/text/section_heading.dart';
import 'package:shopwithusama/common/widgets/brands/brand_card.dart';
import 'package:shopwithusama/features/shop/controllers/brand_controller.dart';
import 'package:shopwithusama/features/shop/controllers/category_controller.dart';
import 'package:shopwithusama/features/shop/screens/brand/all_brands.dart';
import 'package:shopwithusama/features/shop/screens/brand/brand_products.dart';
import 'package:shopwithusama/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/shimmer/brand_shimmer.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = UHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: UAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            UCartCounterIcon(
              iconColor: Colors.black,
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? UColors.black : UColors.white,
                expandedHeight: 420,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(USizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: USizes.spaceBtwItems,
                      ),
                      const USearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: USizes.spaceBtwSections / 2,
                      ),

                      /// Featured Brands
                      USectionHeading(title: 'Feature Brands',onPressed: () => Get.to(()=> const AllBrandsScreen()),),
                      const SizedBox(
                        height: USizes.spaceBtwItems / 1.5,
                      ),

                      Obx(
                        () {
                          if(brandController.isLoading.value){
                            return const UBrandShimmer();
                          }

                          if(brandController.featuredBrands.isEmpty){
                            return Center(child: Text('No Data Found!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                          }

                          return UGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return UBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () => Get.to(()=> BrandProducts(brand: brand)),
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                bottom: UTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name),),).toList(),
                )
              )
            ];
          },
          body: TabBarView(
            children: categories.map((category) => UCategoryTab(category: category,),).toList(),
          ),
        ),
      ),
    );
  }
}

