
class UserModel {
  final String? token;
  final bool? isLogin;

  UserModel({ this.isLogin, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      isLogin: json['isLogin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'isLogin': isLogin,
    };
  }

}
