import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/specialization_response_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.specialization)
  Future<SpecializationsResponseModel> getSpecializations();
}
