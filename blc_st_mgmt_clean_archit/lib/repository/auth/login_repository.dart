import 'package:blc_st_mgmt_clean_archit/models/user/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}
