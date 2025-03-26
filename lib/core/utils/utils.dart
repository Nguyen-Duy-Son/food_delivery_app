
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/enum/storage_keys.dart';
import 'package:food_delivery_app/core/services/shared_preferences_service.dart';
import 'package:food_delivery_app/di.dart';

Future<String> getAccessToken() async {
  final String token = await getIt<SharedPreferencesService>().getStringValue(StorageKeys.accessToken);
  return token;
}

class Utils {
  static getScreenWidth(context) => MediaQuery.of(context).size.width;

  static getScreenHeight(context) => MediaQuery.of(context).size.height;
}