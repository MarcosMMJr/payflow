import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/division_line/horizontal_division_widget.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function(String value) onChanged;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.initialValue,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              onChanged: onChanged,
              initialValue: initialValue,
              validator: validator,
              style: AppTextStyle.input,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                labelStyle: AppTextStyle.input,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        icon,
                        color: AppColors.primary,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                border: InputBorder.none,
              ),
            ),
            const HorizontalDivision()
          ],
        ),
      ),
    );
  }
}
