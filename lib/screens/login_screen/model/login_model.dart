class LoginResponseModel {
  int? status;
  String? message;
  LoginData? data;

  LoginResponseModel({this.status, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? countryShortCode;
  String? countryCode;
  String? mobile;
  String? profileImage;
  String? referCode;
  String? notificationFlag;
  int? tradeCount;
  String? token;
  int? socialLogin;

  LoginData(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.countryShortCode,
      this.countryCode,
      this.mobile,
      this.profileImage,
      this.referCode,
      this.notificationFlag,
      this.tradeCount,
      this.token,
      this.socialLogin});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryShortCode = json['country_short_code'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    profileImage = json['profile_image'];
    referCode = json['refer_code'];
    notificationFlag = json['notification_flag'];
    tradeCount = json['trade_count'];
    token = json['token'];
    socialLogin = json['social_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['country_short_code'] = countryShortCode;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['profile_image'] = profileImage;
    data['refer_code'] = referCode;
    data['notification_flag'] = notificationFlag;
    data['trade_count'] = tradeCount;
    data['token'] = token;
    data['social_login'] = socialLogin;
    return data;
  }
}

class LoginRequestModel {
  String? countryCode;
  String? mobile;
  String? otp;
  String? deviceId;
  String? deviceType;

  LoginRequestModel({
    this.countryCode,
    this.mobile,
    this.otp,
    this.deviceId,
    this.deviceType,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'country_code': countryCode,
      'mobile': mobile,
      'otp': otp,
      'device_id': deviceId,
      'device_type': deviceType,
    };
    return map;
  }
}
