import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class HorizontalDivision extends StatelessWidget {
  const HorizontalDivision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 1,
      color: AppColors.stroke,
    );
  }
}
