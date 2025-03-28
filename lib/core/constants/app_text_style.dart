import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'app_colors.dart';

class AppStyle {
  static double getFontSize(double size) => math.min(size.sp, size + 3);

  static TextStyle regular14black = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle regular14orangeFF7622 = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.orangeFF7622,
    height: 1.4,
  );

  static TextStyle bold14orangeFF7622 = GoogleFonts.manrope(
    fontWeight: FontWeight.w800,
    fontSize: getFontSize(14),
    color: AppColors.orangeFF7622,
    height: 1.4,
  );

  static TextStyle regular14black2E2E2E = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.black2E2E2E,
    height: 1.4,
  );
  static TextStyle regular14grey818181 = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.grey818181,
    height: 1.4,
  );

  static TextStyle bold14black3B3B3B = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: AppColors.black3B3B3B,
    height: 1.4,
  );



  static TextStyle regular14blue1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.blue1C8CEE,
    height: 1.4,
  );

  static TextStyle bold14black2E2E2E = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: AppColors.black2E2E2E,
    height: 1.4,
  );

  static TextStyle regular14gray = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.grey500,
    height: 1.4,
  );

  static TextStyle regular14white = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle bold14white = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle regular16black = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(16),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle bold16blue1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: AppColors.blue1C8CEE,
    height: 1.4,
  );

  static TextStyle regular16grey500= GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(16),
    color: AppColors.grey500,
    height: 1.4,
  );

  static TextStyle medium16black = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(16),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle semiBold18white = GoogleFonts.manrope(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(18),
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle medium14black = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle regular14red = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(14),
    color: AppColors.danger,
    height: 1.4,
  );

  static TextStyle medium14red = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(14),
    color: AppColors.danger,
    height: 1.4,
  );

  static TextStyle bold14primary1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: AppColors.primary1C8CEE,
    height: 1.4,
  );

  static TextStyle bold17black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(17),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle semi17white = GoogleFonts.manrope(
    fontWeight: FontWeight.w600,
    fontSize: getFontSize(17),
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle bold18black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(18),
    color: AppColors.black,
    height: 1.4,
  );
  static TextStyle bold18blue1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(18),
    color: AppColors.blue1C8CEE,
    height: 1.4,
  );
  static TextStyle bold18white = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(18),
    color: AppColors.grey50,
    height: 1.4,
  );
  static TextStyle bold16white = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: AppColors.grey50,
    height: 1.4,
  );
  static TextStyle bold16black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: AppColors.grey900,
    height: 1.4,
  );
  static TextStyle bold16black2E2E2E = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(16),
    color: AppColors.black2E2E2E,
    height: 1.4,
  );
  static TextStyle bold14black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(14),
    color: AppColors.grey900,
    height: 1.4,
  );
  static TextStyle bold20black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(20),
    color: AppColors.grey900,
    height: 1.4,
  );

  // <-------------text => font size 12----------------
  static TextStyle bold12black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(12),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle regular12white= GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle regular12blue1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(12),
    color: AppColors.blue1C8CEE,
    height: 1.4,
  );

  static TextStyle bold12white = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(12),
    color: AppColors.white,
    height: 1.4,
  );

  static TextStyle regular12black = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(12),
    color: AppColors.grey900,
    height: 1.4,
  );

  static TextStyle regular12grey999 = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(12),
    color: AppColors.grey999,
    height: 1.4,
  );

  static TextStyle medium12black = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
    fontSize: getFontSize(12),
    color: AppColors.grey900,
    height: 1.4,
  );
  // -------------text => font size 12---------------->

  static TextStyle bold64primary007AFF = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(64),
    color: AppColors.primary007AFF,
    height: 1.4,
  );

  static TextStyle bold64primary1C8CEE = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(64),
    color: AppColors.primary1C8CEE,
    height: 1.4,
  );

  // <-------------text => font size 10----------------
  static TextStyle regular10black2E2E2E = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(10),
    color: AppColors.black2E2E2E,
    height: 1.4,
  );

  static TextStyle regular12red = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: getFontSize(12),
    color: AppColors.red,
    height: 1.4,
  );


  static TextStyle bold24black = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(24),
    color: AppColors.black,
    height: 1.4,
  );

  static TextStyle bold24white = GoogleFonts.manrope(
    fontWeight: FontWeight.w700,
    fontSize: getFontSize(24),
    color: AppColors.white,
    height: 1.4,
  );

}
