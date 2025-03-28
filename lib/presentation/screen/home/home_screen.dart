import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Center(
          child: Text('Home'),
        ));
  }
}
