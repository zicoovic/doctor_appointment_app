import 'package:doctor_appointment_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import '../../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isRememberMe = false;

  void toggleRememberMe(bool value) {
    isRememberMe = value;
    emit(LoginState.rememberMeChanged(isRememberMe));
  }

  void emitLoginState() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));
    response.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) =>
          emit(LoginState.error(error: error.apiErrorModel.message ?? '')),
    );
  }
}
