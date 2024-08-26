import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/authentication/screens/login/login.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopwithusama/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shopwithusama/features/authentication/screens/signup/signup.dart';
import 'package:shopwithusama/features/authentication/screens/signup/verify_email.dart';
import 'package:shopwithusama/features/personalization/screens/address/address.dart';
import 'package:shopwithusama/features/personalization/screens/profile/profile.dart';
import 'package:shopwithusama/features/personalization/screens/settings/settings.dart';
import 'package:shopwithusama/features/shop/screens/cart/cart.dart';
import 'package:shopwithusama/features/shop/screens/checkout/checkout.dart';
import 'package:shopwithusama/features/shop/screens/home/home.dart';
import 'package:shopwithusama/features/shop/screens/order/order.dart';
import 'package:shopwithusama/features/shop/screens/product_reviews/product_review.dart';
import 'package:shopwithusama/features/shop/screens/store/store.dart';
import 'package:shopwithusama/features/shop/screens/wishlist/wishlist.dart';
import 'package:shopwithusama/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: URoutes.home, page: () => const HomeScreen()),
    GetPage(name: URoutes.store, page: () => const Store()),
    GetPage(name: URoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: URoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: URoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: URoutes.order, page: () => const OrderScreen()),
    GetPage(name: URoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: URoutes.cart, page: () => const CartScreen()),
    GetPage(name: URoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: URoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: URoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: URoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: URoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: URoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}