import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit() : super(const VerifyCodeState());

  static const int codeLength = 4;

  void digitChanged(int index, String value) {
    final digits = List<String>.from(state.digits);
    digits[index] = value;
    emit(state.copyWith(digits: digits));
  }

  void reset() => emit(const VerifyCodeState());
}
