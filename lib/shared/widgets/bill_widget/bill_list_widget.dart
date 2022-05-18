import 'package:flutter/material.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_list_controller.dart';
import 'package:payflow/shared/widgets/bill_widget/bill_tile_widget.dart';

class BillListWidget extends StatefulWidget {
  final BillListController controller;

  BillListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<BillListWidget> createState() => _BillListWidgetState();
}

class _BillListWidgetState extends State<BillListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BillModel>>(
      valueListenable: widget.controller.billsNotifier,
      builder: (_, bills, __) => Column(
        children: bills.map((e) => BillTileWidget(data: e)).toList(),
      ),
    );
  }
}
