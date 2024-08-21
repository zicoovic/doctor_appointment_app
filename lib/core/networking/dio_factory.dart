import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helper/constant.dart';
import '../helper/shared_pref_helper.dart';

class DioFactory {
  //  private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeader();
      addInterceptors();

      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeader() async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getString(SharedPrefKeys.userToken)} ',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void addInterceptors() {
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
    ));
  }
}
