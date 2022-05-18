import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_list_widget.dart';
import 'package:payflow/shared/widgets/division_line/horizontal_division_widget.dart';

class MyStatementPage extends StatefulWidget {
  const MyStatementPage({Key? key}) : super(key: key);

  @override
  State<MyStatementPage> createState() => _MyStatementPageState();
}

class _MyStatementPageState extends State<MyStatementPage> {
  final controller = BillListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Meu extrato",
                  style: AppTextStyle.titleBoldHeading,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24.0),
            child: HorizontalDivision(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BillListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
