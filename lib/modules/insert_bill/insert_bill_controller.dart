import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBillController {
  final formKey = GlobalKey<FormState>();
  BillModel model = BillModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode estar vazio" : null;
  String? validadeDue(String? value) => value?.isEmpty ?? true
      ? "A data de vencimento não pode estar vazia"
      : null;
  String? validateValue(String? value) =>
      value?.isEmpty ?? true ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateBarcode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode estar vazio" : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }

  Future<void> saveBill() async {
    final instance = await SharedPreferences.getInstance();
    final bills = instance.getStringList("bills") ?? <String>[];
    bills.add(model.toJson());
    await instance.setStringList("bills", bills);
    return;
  }

  Future<void> billRegister() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBill();
    }
  }
}
