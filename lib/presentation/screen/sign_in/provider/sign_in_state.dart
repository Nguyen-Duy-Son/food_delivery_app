import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final LoadStatus? signInStatus;
  final String? errorMessage;
  final String? email;
  final String? password;

  const SignInState({
    this.signInStatus,
    this.errorMessage,
    this.email,
    this.password,
  });

  SignInState copyWith({
    LoadStatus? signInStatus,
    String? errorMessage,
    String? email,
    String? password,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        signInStatus,
        errorMessage,
        email,
        password,
      ];
}
