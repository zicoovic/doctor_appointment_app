import 'package:doctor_appointment_app/core/networking/api_result.dart';
import 'package:doctor_appointment_app/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../models/sign_up_response.dart';
import '../models/sign_up_request_body.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
