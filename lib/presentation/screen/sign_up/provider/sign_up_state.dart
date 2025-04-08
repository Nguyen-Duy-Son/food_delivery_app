import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';  // Freezed sẽ tự động tạo file này

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    LoadStatus? signUpStatus,
    String? errorMessage,
    String? fullName,
    String? email,
    String? password,
    String? reTypePassword,
    bool? isRememberMe,
  }) = _SignUpState;
}
