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
import 'package:food_delivery_app/core/dto/sign_up/sign_up_request.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/core/utils/validators.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_action.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_bar_widget.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_dialog.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_page_widget.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_snack_bar.dart';
import 'package:food_delivery_app/presentation/common_widgets/app_text_field.dart';
import 'package:food_delivery_app/presentation/routes/route_name.dart';
import 'package:food_delivery_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:food_delivery_app/presentation/screen/sign_up/provider/sign_up_provider.dart';
import 'package:food_delivery_app/presentation/screen/sign_up/provider/sign_up_state.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isShowPass = false;
  bool isRememberMe = false;
  bool isShowReTypePass = false;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _reTypePasswordController;
  late TextEditingController _fullNameController;

  void _onToggleShowPass() {
    setState(() {
      isShowPass = !isShowPass;
    });
  }

  void _onToggleReTypePass() {
    setState(() {
      isShowReTypePass = !isShowReTypePass;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _reTypePasswordController = TextEditingController();
    _fullNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpControllerProvider);
    ref.listen<LoadStatus?>(signUpControllerProvider.select((value) => value.signUpStatus), (previous, next) {
      if (next == LoadStatus.SUCCESS) {
        _showDialogSendEmail(context);
        AppSnackBar.showSuccess(
          signUpState.errorMessage ?? "",
        );
      }
      if (next == LoadStatus.FAILURE) {
        AppSnackBar.showError(
          signUpState.errorMessage ?? tr("Login failed"),
        );
      }
    });

    return AppPageWidget(
      resizeToAvoidBottomInset: true,
      isLoading: signUpState.signUpStatus == LoadStatus.LOADING,
      extendBodyBehindAppBar: false,
      appbar: const AppBarWidget(
        backgroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.black,
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
                    Text(
                      tr("Sign Up"),
                      style: AppStyle.bold24white,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      tr("Please sign up to get started"),
                      style: AppStyle.regular16grey500,
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Expanded(
                  child: Container(
                    width: 1.sw,
                    height: 1.sh * 0.8,
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
                            label: tr("Full Name"),
                            hintText: tr("Enter your full Name"),
                            controller: _fullNameController,
                            isRequired: true,
                            prefixIcon: _buildIconProfile(),
                            validatorForm: (value) {
                              if (value == null || value.isEmpty) {
                                return tr('validateEmpty');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref
                                  .read(signUpControllerProvider.notifier)
                                  .updateFullName(value);
                            },
                          ),
                          SizedBox(height: 16.h),
                          AppTextField(
                            label: tr("Email"),
                            hintText: tr("Enter your email address"),
                            controller: _emailController,
                            isRequired: true,
                            prefixIcon: _buildIconProfile(),
                            validatorForm: (value) {
                              if (value == null || value.isEmpty) {
                                return tr('validateEmpty');
                              }
                              if (!Validator.validateEmail(value)) {
                                return tr('validateEmail');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref
                                  .read(signUpControllerProvider.notifier)
                                  .updateEmail(value);
                            },
                          ),
                          SizedBox(height: 16.h),
                          AppTextField(
                            label: tr("Password"),
                            controller: _passwordController,
                            isRequired: true,
                            hintText: tr("●●●●●●●●"),
                            suffixIcon: signUpState.password?.isNotEmpty == true
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
                              if (!Validator.validatePassword(value)) {
                                return tr('validatePassword');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref
                                  .read(signUpControllerProvider.notifier)
                                  .updatePassword(value);
                            },
                          ),
                          SizedBox(height: 16.h),
                          AppTextField(
                            label: tr("Re-Type Password"),
                            controller: _reTypePasswordController,
                            isRequired: true,
                            hintText: tr("●●●●●●●●"),
                            suffixIcon:
                                signUpState.reTypePassword?.isNotEmpty == true
                                    ? GestureDetector(
                                        onTap: _onToggleReTypePass,
                                        child: isShowReTypePass
                                            ? _buildEyeCloseIcon()
                                            : _buildEyeIcon(),
                                      )
                                    : const SizedBox(),
                            prefixIcon: _buildIconLock(),
                            obscureText: !isShowReTypePass,
                            validatorForm: (value) {
                              if (value == null || value.isEmpty) {
                                return tr('validateEmpty');
                              }
                              if (!Validator.validatePassword(value)) {
                                return tr('validatePassword');
                              }
                              if (value != _passwordController.text) {
                                return tr('validateReTypePassword');
                              }
                              return null;
                            },
                            onChanged: (value) {
                              ref
                                  .read(signUpControllerProvider.notifier)
                                  .updateReTypePassword(value);
                            },
                          ),
                          SizedBox(height: 20.h),
                          AppActionWidget(
                            content: tr("SIGN UP"),
                            onPressed: () => signUp,
                            backgroundColor: AppColors.orangeFFA500,
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr("You have an account?"),
                                style: AppStyle.regular14gray,
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.signInScreen,
                                      arguments: SignInScreenArguments(
                                          isShowBackButton: true));
                                },
                                child: Text(
                                  tr("SIGN IN"),
                                  style: AppStyle.bold14orangeFF7622,
                                ),
                              ),
                            ],
                          ),
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

  void _showDialogSendEmail(BuildContext context) {
    showAppDialog(
      context,
      title: tr("Send email"),
      content: Text(
        tr("Please check your email to verify your account"),
        style: AppStyle.regular16black,
        textAlign: TextAlign.center,
      ),
      backgroundPositiveButton: AppColors.orangeFFA500,
      colorTextPositive: AppColors.white,
      urlIcon: AppIcons.icMail,
      textPositive: tr("OK"),
      hideNegativeButton: true,
      onPressPositive: () {
        Navigator.pushReplacementNamed(
          context,
          RouteName.signInScreen,
          arguments: SignInScreenArguments(isShowBackButton: false),
        );
      },
      onPressNegative: () {
        Navigator.of(context).pop();
      },
    );

  }

  void signUp() async {
    if (_formKey.currentState?.validate() == true) {
      FocusScope.of(context).unfocus();
      SignUpRequestEntity signUpRequestEntity =
      SignUpRequestEntity(
        fullName: _fullNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      ref
          .read(signUpControllerProvider.notifier)
          .signUp(
          signUpRequestEntity:
          signUpRequestEntity);
    }
  }

}
