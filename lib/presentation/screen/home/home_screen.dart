import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_page_widget.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    _cancelToken?.cancel();
    _cancelToken = null;
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
