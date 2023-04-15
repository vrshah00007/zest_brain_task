import 'package:zest_brain_task/network/api_end_points.dart';
import 'package:zest_brain_task/screens/home_screen/model/on_going_model.dart';
import 'package:zest_brain_task/screens/login_screen/model/login_model.dart';

import 'api_base_helper.dart';

class LoginRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<LoginData?> fetchAuth(LoginRequestModel requestModel) async {
    final response = await _helper.post(
      loginApi,
      requestModel.toJson(),
    );
    return LoginResponseModel.fromJson(response).data;
  }
}

class TradeListApi {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<OnGoingResponseModel> tradeList(TradeListRequestModel requestModel) async {
    try {
      final response = await _helper.post('mentor/trade_list', requestModel.toJson(),
          tokenSend: true);

      return OnGoingResponseModel.fromJson(response);
    } catch (e) {
      print(e);
      return OnGoingResponseModel();
    }
  }
}
