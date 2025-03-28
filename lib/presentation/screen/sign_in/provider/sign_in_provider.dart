import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/core/services/shared_preferences_service.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_state.dart';
import 'package:riverpod/riverpod.dart';
import 'package:food_delivery_app/core/repositories/auth_repository.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_response.dart';

import '../../../../core/enum/storage_keys.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  throw UnimplementedError(); // Tránh gọi trực tiếp nếu chưa override
});

final signInControllerProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignInNotifier(repo: repo);
});

class SignInNotifier extends StateNotifier<SignInState> {
  final AuthRepository _repo;

  SignInNotifier({required AuthRepository repo})
      : _repo = repo,
        super(const SignInState());

  Future<void> signIn({required SignInRequestEntity signInRequestEntity, BuildContext? context}) async {
    // Cập nhật trạng thái đang tải
    state = state.copyWith(signInStatus: LoadStatus.LOADING);
    try {
      final result = await _repo.signIn(signInRequestEntity: signInRequestEntity);
      return result.fold(
        (failure) {
          state = state.copyWith(errorMessage: failure.message, signInStatus: LoadStatus.FAILURE);
        },
        (response) async{
          await saveDataAfterLogin(response.data!);
          state = state.copyWith(errorMessage: null, signInStatus: LoadStatus.SUCCESS);
        },
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), signInStatus: LoadStatus.FAILURE);
    }
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> saveDataAfterLogin(SignInResponseEntity data) async{
    await getIt<SharedPreferencesService>().setStringValue(StorageKeys.accessToken, data.accessToken ?? '');
    await getIt<SharedPreferencesService>().setStringValue(StorageKeys.refreshToken, data.refreshToken ?? '');
    await getIt<SharedPreferencesService>().setStringValue(StorageKeys.userData, jsonEncode(data.user));
  }

}
