import 'dart:convert';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TicketModel {
  final String id = uuid.v5(Uuid.NAMESPACE_URL, 'GESPCo');
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;
  final String? assignedEvent;
  final String? status;

  TicketModel(
      {id,
      this.name,
      this.dueDate,
      this.value,
      this.barcode,
      this.assignedEvent,
      this.status});

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
        assignedEvent: map['assignedEvent']);
  }

  String toJson() => jsonEncode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'TicketModel(id: $id, name: $name, dueDate: $dueDate, value: $value, barcode: $barcode, assigned: $assignedEvent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode &&
        other.assignedEvent == assignedEvent;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        barcode.hashCode ^
        assignedEvent.hashCode;
  }
}
