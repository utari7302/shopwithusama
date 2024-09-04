import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/data/repositories/address/address_repository.dart';
import 'package:shopwithusama/features/personalization/models/address_model.dart';
import 'package:shopwithusama/utils/network/network_manager.dart';
import 'package:shopwithusama/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularProgressIndicator()
      );
      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      //Set the selected field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);

      Get.back();
    } catch (e) {
      ULoaders.errorSnackBar(
          title: 'Error in selection', message: e.toString());
      return [];
    }
  }

  Future addNewAddresses() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog(
          "Storing Address...", UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        // Remove Loader
        UFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show success message
      ULoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
