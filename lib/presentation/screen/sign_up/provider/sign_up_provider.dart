import 'package:food_delivery_app/core/dto/sign_up/sign_up_request.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/presentation/screen/sign_up/provider/sign_up_state.dart';
import 'package:riverpod/riverpod.dart';
import 'package:food_delivery_app/core/repositories/auth_repository.dart';

final authSignUpRepositoryProvider = Provider<AuthRepository>((ref) {
  throw UnimplementedError(); // Tránh gọi trực tiếp nếu chưa override
});

final signUpControllerProvider = StateNotifierProvider<SignUpNotifier, SignUpState>((ref) {
  final repo = ref.watch(authSignUpRepositoryProvider);
  return SignUpNotifier(repo: repo);
});

class SignUpNotifier extends StateNotifier<SignUpState> {
  final AuthRepository _repo;

  SignUpNotifier({required AuthRepository repo})
      : _repo = repo,
        super(const SignUpState());

  Future<void> signUp({required SignUpRequestEntity signUpRequestEntity}) async {
    // Cập nhật trạng thái đang tải
    state = state.copyWith(signUpStatus: LoadStatus.LOADING);
    try {
      final result = await _repo.signUp(signUpRequestEntity: signUpRequestEntity);
      return result.fold(
        (failure) {
          state = state.copyWith(errorMessage: failure.message, signUpStatus: LoadStatus.FAILURE);
        },
        (response) {
          state = state.copyWith(errorMessage: response.data?.message, signUpStatus: LoadStatus.SUCCESS);
        },
      );

    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), signUpStatus: LoadStatus.FAILURE);
    }
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updateFullName(String fullName) {
    state = state.copyWith(fullName: fullName);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void updateReTypePassword(String reTypePassword) {
    state = state.copyWith(reTypePassword: reTypePassword);
  }



}
