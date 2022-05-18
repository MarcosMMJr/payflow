import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillListController {
  final billsNotifier = ValueNotifier<List<BillModel>>(<BillModel>[]);
  List<BillModel> get bills => billsNotifier.value;
  set bills(List<BillModel> value) => billsNotifier.value = value;

  BillListController() {
    getBills();
  }

  Future<void> getBills() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("bills") ?? <String>[];
      bills = response.map((e) => BillModel.fromJson(e)).toList();
    } catch (e) {
      bills = <BillModel>[];
    }
  }
}
