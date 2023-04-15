class OnGoingResponseModel {
  int? status;
  String? message;
  List<OnGoingData>? data;
  int? newTrades;

  OnGoingResponseModel({this.status, this.message, this.data, this.newTrades});

  OnGoingResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OnGoingData>[];
      json['data'].forEach((v) {
        data!.add(new OnGoingData.fromJson(v));
      });
    }
    newTrades = json['new_trades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['new_trades'] = this.newTrades;
    return data;
  }
}

class OnGoingData {
  int? id;
  int? mentorId;
  String? type;
  int? entryPrice;
  String? name;
  String? stock;
  int? exitPrice;
  int? exitHigh;
  int? stopLossPrice;
  String? action;
  String? result;
  String? status;
  String? postedDate;
  String? fee;
  int? isSubscribe;
  User? user;

  OnGoingData(
      {this.id,
      this.mentorId,
      this.type,
      this.entryPrice,
      this.name,
      this.stock,
      this.exitPrice,
      this.exitHigh,
      this.stopLossPrice,
      this.action,
      this.result,
      this.status,
      this.postedDate,
      this.fee,
      this.isSubscribe,
      this.user});

  OnGoingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mentorId = json['mentor_id'];
    type = json['type'];
    entryPrice = json['entry_price'];
    name = json['name'];
    stock = json['stock'];
    exitPrice = json['exit_price'];
    exitHigh = json['exit_high'];
    stopLossPrice = json['stop_loss_price'];
    action = json['action'];
    result = json['result'];
    status = json['status'];
    postedDate = json['posted_date'];
    fee = json['fee'];
    isSubscribe = json['is_subscribe'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mentor_id'] = this.mentorId;
    data['type'] = this.type;
    data['entry_price'] = this.entryPrice;
    data['name'] = this.name;
    data['stock'] = this.stock;
    data['exit_price'] = this.exitPrice;
    data['exit_high'] = this.exitHigh;
    data['stop_loss_price'] = this.stopLossPrice;
    data['action'] = this.action;
    data['result'] = this.result;
    data['status'] = this.status;
    data['posted_date'] = this.postedDate;
    data['fee'] = this.fee;
    data['is_subscribe'] = this.isSubscribe;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? profileImage;

  User({this.id, this.name, this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_image'] = this.profileImage;
    return data;
  }
}

class TradeListRequestModel {
  String? filters;
  String? limit;
  String? offset;

  TradeListRequestModel({this.filters, this.limit, this.offset});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'filters': filters,
      'limit': limit,
      'offset': offset,
    };
    return map;
  }
}
