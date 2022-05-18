import 'dart:convert';

class BillModel {
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  BillModel({
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
  });

  BillModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return BillModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BillModel.fromJson(String source) =>
      BillModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BillModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;
  }
}
