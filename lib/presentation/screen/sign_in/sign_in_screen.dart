import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_icons.dart';
import 'package:food_delivery_app/core/constants/app_padding.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_action.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_check_box.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_page_widget.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_text_field.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_provider.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_state.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isShowPass = false;
  bool isRememberMe = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  void _onToggleShowPass() {
    setState(() {
      isShowPass = !isShowPass;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    final signInState = ref.watch(signInControllerProvider);
    ref.listen<SignInState>(signInControllerProvider, (previous, next) {
      if (next.signInStatus == LoadStatus.SUCCESS) {
        Navigator.pushReplacementNamed(context, RouteName.homeScreen);
      }
      if (next.signInStatus == LoadStatus.FAILURE) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage ?? tr("Sign in failed"))),
        );
      }
    });
    return AppPageWidget(
      resizeToAvoidBottomInset: true,
      isLoading: signInState.signInStatus == LoadStatus.LOADING,
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          tr("Log In"),
                          style: AppStyle.bold24white,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          tr("Please sign in to your existing account"),
                          style: AppStyle.regular16grey500,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      width: 1.sw,
                      height: 1.sh * 0.72,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal, vertical: AppPadding.vertical),
                      child: Column(
                        children: [
                          AppTextField(
                            label: tr("Email"),
                            hintText: tr("Enter your email address"),
                            controller: _emailController,
                            prefixIcon: _buildIconProfile(),
                            validatorForm: (value) {
                              if (value == null || value.isEmpty) {
                                return tr('validateEmpty');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref.read(signInControllerProvider.notifier).updateEmail(value);
                            },
                          ),
                          SizedBox(height: 16.h),
                          AppTextField(
                            label: tr("Password"),
                            hintText: tr("Enter your password"),
                            controller: _passwordController,
                            suffixIcon: signInState.password?.isNotEmpty == true
                                ? GestureDetector(
                                    onTap: _onToggleShowPass,
                                    child: isShowPass ? _buildEyeCloseIcon() : _buildEyeIcon(),
                                  )
                                : const SizedBox(),
                            prefixIcon: _buildIconLock(),
                            obscureText: !isShowPass,
                            validatorForm: (value) {
                              if (value == null || value.isEmpty) {
                                return tr('validateEmpty');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref.read(signInControllerProvider.notifier).updatePassword(value);
                            },
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppCheckBoxWidget(
                                value: isRememberMe,
                                onClick: (value) {
                                  setState(() {
                                    isRememberMe = value;
                                  });
                                },
                                label: tr("Remember me"),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  tr("Forgot password"),
                                  textAlign: TextAlign.end,
                                  style: AppStyle.regular14orangeFF7622,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          AppActionWidget(
                            content: tr("LOG IN"),
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                ref.read(signInControllerProvider.notifier).signIn(
                                  signInRequestEntity: SignInRequestEntity(
                                      email: signInState.email,
                                      password: signInState.password,
                                    ),
                                );
                              }
                            },
                            backgroundColor: AppColors.orangeFFA500,
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr("Don't have an account?"),
                                style: AppStyle.regular14gray,
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteName.signUpScreen);
                                },
                                child: Text(
                                  tr("SIGN UP"),
                                  style: AppStyle.bold14orangeFF7622,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            tr("Or"),
                            style: AppStyle.regular14grey818181,
                          ),
                          SizedBox(height: 16.h),
                          _buildSelectSignIn(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEyeIcon() {
    return (SvgPicture.asset(
      AppIcons.icEye,
      width: min(20.w, 30),
      height: min(20.w, 30),
    ));
  }

  Widget _buildEyeCloseIcon() {
    return (SvgPicture.asset(
      AppIcons.icEyeClose,
      width: min(20.w, 30),
      height: min(20.w, 30),
    ));
  }

  Widget _buildIconLock() {
    return (SvgPicture.asset(
      AppIcons.icLock,
      width: min(20.w, 28),
      height: min(20.w, 28),
    ));
  }

  Widget _buildIconProfile() {
    return (SvgPicture.asset(
      AppIcons.icProfile,
      width: min(20.w, 28),
      height: min(20.w, 28),
    ));
  }

  Widget _buildSelectSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blue1C8CEE,
              borderRadius: BorderRadius.circular(100.r),
            ),
            alignment: Alignment.center,
            width: 48.w,
            height: 48.w,
            child: SvgPicture.asset(
              AppIcons.icFacebook,
              width: 20.w,
              height: 20.w,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyF2F2F7,
              borderRadius: BorderRadius.circular(100.r),
            ),
            alignment: Alignment.center,
            width: 48.w,
            height: 48.w,
            child: SvgPicture.asset(
              AppIcons.icGoogle,
              width: 20.w,
              height: 20.w,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(100.r),
            ),
            alignment: Alignment.center,
            width: 48.w,
            height: 48.w,
            child: SvgPicture.asset(
              AppIcons.icApple,
              width: 20.w,
              height: 20.w,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

}
