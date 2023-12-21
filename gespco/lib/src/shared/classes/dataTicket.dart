import 'dart:convert';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class TicketModel {
  final String id = uuid.v5(Uuid.NAMESPACE_URL, 'GESPCo');
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;

  TicketModel({
    id,
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
  });

  TicketModel copyWith({
    String? id,
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return TicketModel(
      id: id ?? this.id,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id: map['id'],
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketModel(id: $id, name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketModel &&
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