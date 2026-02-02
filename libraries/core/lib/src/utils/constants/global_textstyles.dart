import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextStyles {
  GlobalTextStyles._();

  static TextStyle styleWhite16W60 = GoogleFonts.montserrat(
    color: GlobalColors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
