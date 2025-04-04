import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';  // Freezed sẽ tự động tạo file này

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    LoadStatus? signInStatus,
    String? errorMessage,
    String? email,
    String? password,
    bool? isRememberMe,
  }) = _SignInState;
}
