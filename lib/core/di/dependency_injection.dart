import 'package:dio/dio.dart';
import 'package:doctor_appointment_app/core/networking/api_service.dart';
import 'package:doctor_appointment_app/features/home/data/apis/home_api_service.dart';
import 'package:doctor_appointment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointment_app/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //Home specialization
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
