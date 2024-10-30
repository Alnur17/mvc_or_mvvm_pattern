import 'package:shared_preferences/shared_preferences.dart';
import 'package:mvc_or_mvvm_pattern/models/login/user_model.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', responseModel.token.toString());
    pref.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token').toString();
    bool? isLogin = pref.getBool('isLogin');
    return UserModel(
      token: token,
      isLogin: isLogin,
    );
  }

  Future<bool> clearUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }
}
