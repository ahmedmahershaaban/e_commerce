import 'dart:convert';

import 'package:e_commerce/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LocalStorageData {
  Future<UserModel?> get getUserData async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString(CACHED_SHARED_PREFERENCES);
    try {
      return UserModel.fromJson(json.decode(data!));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(
        CACHED_SHARED_PREFERENCES, json.encode(userModel.toJson()));
  }

  deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
