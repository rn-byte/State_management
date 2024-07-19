import 'package:blc_st_mgmt_clean_archit/models/user/user_model.dart';
import 'package:blc_st_mgmt_clean_archit/repository/auth/login_repository.dart';

class LoginMockApiRepository implements LoginRepository {
  @override
  Future<UserModel> loginApi(dynamic data) async {
    Future.delayed(const Duration(seconds: 2));
    final response = {
      'token': 'sdjhfuwhdjnvjfhgsd',
    };
    return UserModel.fromJson(response);
  }
}
