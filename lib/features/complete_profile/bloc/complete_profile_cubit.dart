import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(const CompleteProfileState());

  static const List<String> countryCodes = ['+1', '+44', '+91', '+92', '+971'];
  static const List<String> genders = ['Male', 'Female', 'Other'];

  void countryCodeChanged(String code) {
    emit(state.copyWith(countryCode: code));
  }

  void genderChanged(String gender) {
    emit(state.copyWith(gender: gender));
  }
}
