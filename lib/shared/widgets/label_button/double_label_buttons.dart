import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/division_line/horizontal_division_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/division_Line/vertical_division_widget.dart';

class DoubleLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const DoubleLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HorizontalDivision(),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  child: LabelButton(
                    label: primaryLabel,
                    style:
                        enablePrimaryColor ? AppTextStyle.buttonPrimary : null,
                    onPressed: primaryOnPressed,
                  ),
                )),
                const VerticalDivision(),
                Expanded(
                    child: GestureDetector(
                  child: LabelButton(
                    label: secondaryLabel,
                    style: enableSecondaryColor
                        ? AppTextStyle.buttonPrimary
                        : null,
                    onPressed: secondaryOnPressed,
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
