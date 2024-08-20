import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

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

  static void addDioHeader() {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzI0MTQwODc5LCJleHAiOjE3MjQyMjcyNzksIm5iZiI6MTcyNDE0MDg3OSwianRpIjoiaFlzTkFiQ2xaSjNOSHc2dSIsInN1YiI6IjE4MTIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.RhlzGJWFd2dMQo6nkiYJUoI1HSV6AaUIbeAzNaIM4C4 ',
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
