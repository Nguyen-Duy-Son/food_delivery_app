import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_icons.dart';
import 'package:food_delivery_app/core/constants/app_padding.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:food_delivery_app/core/dto/sign_in/sign_in_request.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/core/enum/storage_keys.dart';
import 'package:food_delivery_app/core/services/shared_preferences_service.dart';
import 'package:food_delivery_app/di.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_action.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_bar_widget.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_check_box.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_page_widget.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_snack_bar.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_text_field.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_provider.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/provider/sign_in_state.dart';

class SignInScreenArguments {
  final bool? isShowBackButton;

  SignInScreenArguments({
    this.isShowBackButton = false,
  });
}

class SignInScreen extends ConsumerStatefulWidget {
  final SignInScreenArguments? arguments;
  const SignInScreen({super.key, this.arguments});

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
    initData();
  }

  void initData() async {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    final isRemember = await getIt<SharedPreferencesService>()
        .getBoolValue(StorageKeys.isRememberMe);
    final email = await getIt<SharedPreferencesService>()
        .getStringValue(StorageKeys.email);
    final password = await getIt<SharedPreferencesService>()
        .getStringValue(StorageKeys.password);
    setState(() {
       isRememberMe = isRemember;
      _emailController.text = email;
      _passwordController.text = password;
    });
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<LoadStatus?>(signInControllerProvider.select((value) => value.signInStatus), (previous, next) {
      if (next == LoadStatus.SUCCESS) {
        Navigator.pushReplacementNamed(context, RouteName.homeScreen);
      }
      if (next == LoadStatus.FAILURE) {
        String errorMessage = ref.watch(signInControllerProvider).errorMessage ?? tr("Login failed");
        AppSnackBar.showError(
          errorMessage,
        );
      }
    });
    final signInState = ref.watch(signInControllerProvider);

    return AppPageWidget(
      resizeToAvoidBottomInset: true,
      isLoading: signInState.signInStatus == LoadStatus.LOADING,
      backgroundColor: AppColors.black,
      appbar: widget.arguments?.isShowBackButton == true ? AppBarWidget(
        isShowBackButton: widget.arguments?.isShowBackButton ?? true,
        backgroundColor: AppColors.black,
      ) : null,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100.h),
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
                Expanded(
                  child: Container(
                    width: 1.sw,
                    // height: 1.sh * 0.6,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.horizontal,
                        vertical: AppPadding.vertical),
                    child: SingleChildScrollView(
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
                              ref
                                  .read(signInControllerProvider.notifier)
                                  .updateEmail(value);
                            },
                          ),
                          SizedBox(height: 16.h),
                          AppTextField(
                            label: tr("Password"),
                            hintText: tr("●●●●●●●●"),
                            controller: _passwordController,
                            suffixIcon: signInState.password?.isNotEmpty == true
                                ? GestureDetector(
                                    onTap: _onToggleShowPass,
                                    child: isShowPass
                                        ? _buildEyeCloseIcon()
                                        : _buildEyeIcon(),
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
                              ref
                                  .read(signInControllerProvider.notifier)
                                  .updatePassword(value);
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
                                  ref
                                      .read(signInControllerProvider.notifier)
                                      .rememberMe(value, _emailController.text,
                                          _passwordController.text);
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
                                ref
                                    .read(signInControllerProvider.notifier)
                                    .signIn(
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
                                  Navigator.pushNamed(
                                      context, RouteName.signUpScreen);
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
                          _buildSelectSignIn(ref),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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

  Widget _buildSelectSignIn(WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: () {
            // ref.read(signInControllerProvider.notifier).loginWithFacebook();
          },
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
