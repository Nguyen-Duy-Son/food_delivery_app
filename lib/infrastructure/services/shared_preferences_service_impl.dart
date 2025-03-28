
import 'package:food_delivery_app/core/enum/storage_keys.dart';
import 'package:food_delivery_app/core/services/logger_service.dart';
import 'package:food_delivery_app/core/services/shared_preferences_service.dart';
import 'package:food_delivery_app/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServiceImpl implements SharedPreferencesService {
  final _loggerService = getIt<LoggerService>();

  @override
  Future<void> setStringValue(StorageKeys key, String value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString(key.name, value);
    } on Exception catch (error, stackTrace) {
      _loggerService.error('setStringValue $key: $error', stackTrace: stackTrace);
    }
  }

  @override
  Future<String> getStringValue(StorageKeys key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final value = preferences.getString(key.name) ?? '';
      return value;
    } on Exception catch (error, stackTrace) {
      _loggerService.error('getStringValue $key: $error', stackTrace: stackTrace);
      return '';
    }
  }

  @override
  Future<void> setIntValue(StorageKeys key, int value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      preferences.setInt(key.name, value);
    } on Exception catch (error, stackTrace) {
      _loggerService.error('setIntValue $key: $error', stackTrace: stackTrace);
    }
  }

  @override
  Future<int?> getIntValue(StorageKeys key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final value = preferences.getInt(key.name);
      return value;
    } on Exception catch (error, stackTrace) {
      _loggerService.error('getIntValue $key: $error', stackTrace: stackTrace);
      return null;
    }
  }

  @override
  Future<void> removeByKey(StorageKeys key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key.name);
    } on Exception catch (error, stackTrace) {
      _loggerService.error('removeByKey $key: $error', stackTrace: stackTrace);
    }
  }

  @override
  Future<bool> getBoolValue(StorageKeys key) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final value = preferences.getBool(key.name) ?? false;
      return value;
    } on Exception catch (error, stackTrace) {
      _loggerService.error('getStringValue $key: $error', stackTrace: stackTrace);
      return false;
    }
  }

  @override
  Future<void> setBoolValue(StorageKeys key, bool value) async {
    try {
      final preferences = await SharedPreferences.getInstance();
      preferences.setBool(key.name, value);
    } on Exception catch (error, stackTrace) {
      _loggerService.error('setStringValue $key: $error', stackTrace: stackTrace);
    }
  }
}
