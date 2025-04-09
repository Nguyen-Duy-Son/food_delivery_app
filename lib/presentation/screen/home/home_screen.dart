import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_page_widget.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CancelToken? _cancelToken;

  @override
  void initState() {
    super.initState();
    _cancelToken = CancelToken();
    _askAccessLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken?.cancel();
    _cancelToken = null;
  }

  Future<void> _askAccessLocation() async {
    // Đầu tiên, kiểm tra nếu là Android/iOS
    if (Platform.isAndroid) {
      // Lấy trạng thái hiện tại của quyền truy cập vị trí
      final status = await Permission.location.status;

      print("Current location permission status: $status");

      if (status.isGranted) {
        print("✅ Location permission is already granted.");
        return;
      }

      if (status.isDenied || status.isRestricted || status.isLimited) {
        print("❗ Location permission is currently denied/restricted → Requesting...");

        // Yêu cầu quyền truy cập vị trí
        final result = await Permission.location.request();

        if (result.isGranted) {
          print("✅ Permission granted after request.");
        } else if (result.isPermanentlyDenied) {
          print("⛔ Permission permanently denied → Opening settings.");
          await _openSettings();
        } else {
          print("❌ Permission denied.");
        }

        return;
      }

      if (status.isPermanentlyDenied) {
        print("⛔ Location permission permanently denied. Opening app settings...");
        await _openSettings();
      }
    }
    else {

    }
  }

  Future<void> _openSettings() async {
    bool opened = await openAppSettings();
    print(opened
        ? "⚙️ Opened app settings successfully."
        : "❌ Failed to open app settings.");
  }

  @override
  Widget build(BuildContext context) {
    return AppPageWidget(
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
