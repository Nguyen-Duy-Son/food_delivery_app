import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:food_delivery_app/core/constants/app_text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;

  final String? defaultValue;
  final String? initialValue;
  final String? hintText;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool isRequired;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? validator;
  final bool enable;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String? label;
  final TextStyle? styleLabel;
  final String? Function(String?)? validatorForm;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final bool? isPaddingSuffixIcon;
  final Widget? maxScore;
  final AutovalidateMode? autoMode;
  final void Function()? onBlur;

  const AppTextField({
    Key? key,
    this.controller,
    this.defaultValue,
    this.initialValue,
    this.hintText,
    this.maxLength,
    this.maxLine = 1,
    this.keyboardType,
    this.isRequired = false,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.enable = true,
    this.inputFormatters,
    this.obscureText = false,
    this.label = "",
    this.styleLabel,
    this.validatorForm,
    this.prefixIcon,
    this.onTap,
    this.isReadOnly,
    this.isPaddingSuffixIcon = true,
    this.maxScore,
    this.autoMode,
    this.onBlur,
  }) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.defaultValue ?? widget.initialValue ?? "");

    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });

    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller && widget.controller != null) {
      _controller.removeListener(_onTextChanged);
      _controller = widget.controller!;
      _controller.addListener(_onTextChanged);
    }
  }

  void _onTextChanged() {
    widget.onChanged?.call(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label?.isNotEmpty == true) ...[
          Row(
            children: [
              Text(
                tr(widget.label!),
                style: widget.styleLabel ??
                    AppStyle.bold14black.copyWith(
                      color: AppColors.black3B3B3B,
                    ),
              ),
              if (widget.isRequired) ...[
                SizedBox(width: 4.w),
                Text(
                  "*",
                  style: AppStyle.medium16black.copyWith(
                    color: AppColors.danger,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          onTap: widget.onTap ?? () {},
          focusNode: _focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlignVertical: TextAlignVertical.center,
          enableSuggestions: false,
          autocorrect: false,
          initialValue: widget.initialValue,
          controller: _controller,
          maxLength: widget.maxLength,
          obscuringCharacter: "●",
          obscureText: widget.obscureText,
          maxLines: widget.maxLine,
          enabled: widget.enable,
          inputFormatters: widget.inputFormatters,
          textInputAction: TextInputAction.done,
          validator: widget.validatorForm,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.enable ? AppColors.white : AppColors.greyEAEAEA,
            counter: null,
            contentPadding: EdgeInsets.only(
                left: 2.w,
                right: 10.w,
                top: MediaQuery.of(context).orientation == Orientation.landscape ? 16 : 16.5,
                bottom: MediaQuery.of(context).orientation == Orientation.landscape ? 16 : 16.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.w),
              borderSide: const BorderSide(color: AppColors.greyC0C0C0),
            ),
            disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColors.white), borderRadius: BorderRadius.circular(8.w)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyC0C0C0),
              borderRadius: BorderRadius.circular(8.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyC0C0C0),
              borderRadius: BorderRadius.circular(8.w),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.danger500),
              borderRadius: BorderRadius.circular(8.w),
            ),
            // Tùy chỉnh viền khi có lỗi và người dùng focus vào ô input
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.danger500),
              borderRadius: BorderRadius.circular(8.w),
            ),
            hintText: tr(widget.hintText!),
            hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: min(12.sp, 16.0),
              color: AppColors.grey500,
              height: 1.4,
            ),
            prefix: SizedBox(width: 8.w),

            suffixIcon: widget.suffixIcon != null
                ? Padding(padding: EdgeInsets.only(right: widget.isPaddingSuffixIcon == false ? 0 : 12.w), child: widget.suffixIcon)
                : null,
            suffixIconConstraints: BoxConstraints(minWidth: 15.w, minHeight: 15.h),
            isDense: true,
            errorStyle: GoogleFonts.roboto(
              fontSize: min(14.sp, 16.0),
              fontWeight: FontWeight.w400,
              color: AppColors.danger,
            ),
            errorMaxLines: 3,
            prefixIcon: widget.prefixIcon != null ? Padding(padding: EdgeInsets.only(left: 8.w), child: widget.prefixIcon) : null,
            prefixIconConstraints: BoxConstraints(minWidth: 15.w, minHeight: 15.h),
          ),
          keyboardType: widget.keyboardType,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          style: GoogleFonts.roboto(
            fontSize: min(14.sp, 16.0),
            fontWeight: FontWeight.normal,
            color: AppColors.black,
            height: 1.4,
          ),
          readOnly: widget.isReadOnly ?? false,
          onEditingComplete: () {
            _controller.text = _controller.text.trim();
            _focusNode.unfocus();
            widget.onBlur?.call();
          },
          onTapOutside: (focusNode) {
            _controller.text = _controller.text.trim();
            _focusNode.unfocus();
            widget.onBlur?.call();
          },
        ),
      ],
    );
  }
}
