import 'package:blc_st_mgmt_clean_archit/config/app_url.dart';
import 'package:blc_st_mgmt_clean_archit/data/network/network_api_services.dart';
import 'package:blc_st_mgmt_clean_archit/models/user/user_model.dart';

class LoginRepository {
  final _api = NetworkApiServices();

  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginUrlEndpoint, data);
    return UserModel.fromJson(response);
  }
}
