part of 'verify_code_cubit.dart';

class VerifyCodeState {
  const VerifyCodeState({this.digits = const ['', '', '', '']});

  final List<String> digits;

  String get code => digits.join();

  bool get isComplete => digits.every((digit) => digit.isNotEmpty);

  VerifyCodeState copyWith({List<String>? digits}) {
    return VerifyCodeState(digits: digits ?? this.digits);
  }
}
