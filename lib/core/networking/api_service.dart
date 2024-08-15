import 'package:dio/dio.dart';
import 'package:doctor_appointment_app/core/networking/api_constants.dart';
import 'package:doctor_appointment_app/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse> signUp(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}
