import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = LocalStorageData();

  ValueNotifier<bool> get isLoadingUserModel => _isLoadingUserModel;
  ValueNotifier<bool> _isLoadingUserModel = ValueNotifier(false);

  UserModel? get userModel => _userModel;
  UserModel? _userModel;

  @override
  void onInit() {
    super.onInit();
    _getUserModel();
  }

  void _getUserModel() async {
    _isLoadingUserModel.value = true;
    await localStorageData.getUserData.then((value) {
      _userModel = value;
    });
    _isLoadingUserModel.value = false;
    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
