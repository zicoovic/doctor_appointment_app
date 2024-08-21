import 'package:doctor_appointment_app/core/helper/extension.dart';
import 'package:doctor_appointment_app/core/networking/api_error_handler.dart';
import 'package:doctor_appointment_app/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment_app/features/home/logic/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<SpecializationsData?>? specializationList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getSpecializations();
    response.when(
      success: (specializationsResponseModel) {
        specializationList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default
        getDoctorsList(specializationId: specializationList?.first?.id);

        emit(HomeState.specializationsSuccess(specializationList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? specializationDoctorList =
        getDoctorsListBySpecializationListId(specializationId);
    if (!specializationDoctorList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(specializationDoctorList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle("No doctors found")));
    }
  }

  /// returns the list of doctors based on specialization id
  getDoctorsListBySpecializationListId(specializationId) {
    return specializationList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
