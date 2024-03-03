import 'package:flutter_08_project/models/login_request.dart';
import 'package:flutter_08_project/models/login_response.dart';
import 'package:flutter_08_project/network/apis/login_apis.dart';
import 'package:flutter_08_project/network/configs/data_state.dart';

class LoginRepository {
  Future<DataState<LoginResponseModel?>> login(LoginRequest request) async {
    final responseFromApi = await LoginApi().login(request);
    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
