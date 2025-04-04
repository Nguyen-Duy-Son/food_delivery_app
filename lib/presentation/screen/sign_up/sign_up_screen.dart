import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_bar_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleAppBar: '',
      ),
      body: Center(
        child: Text('Sign In Screen'),
      ),
    );
  }
}
