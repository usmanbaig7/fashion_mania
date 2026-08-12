part of 'complete_profile_cubit.dart';

class CompleteProfileState {
  const CompleteProfileState({this.countryCode = '+1', this.gender});

  final String countryCode;
  final String? gender;

  CompleteProfileState copyWith({String? countryCode, String? gender}) {
    return CompleteProfileState(
      countryCode: countryCode ?? this.countryCode,
      gender: gender ?? this.gender,
    );
  }
}
