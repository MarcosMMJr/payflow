import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_info_widget.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_list_widget.dart';
import 'package:payflow/shared/widgets/division_line/horizontal_division_widget.dart';

class MyBillsPage extends StatefulWidget {
  const MyBillsPage({Key? key}) : super(key: key);

  @override
  State<MyBillsPage> createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final controller = BillListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BillModel>>(
                    valueListenable: controller.billsNotifier,
                    builder: (_, bills, __) => AnimatedCard(
                        direction: AnimatedCardDirection.top,
                        child: BillInfoWidget(size: bills.length))),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  "Meus boletos",
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
