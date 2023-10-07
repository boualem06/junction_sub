// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BankController extends ChangeNotifier {
  List<Bank> banks = [
    Bank(name: 'ALGERIE POSTE', value: 12000),
    Bank(name: 'GULF Bank', value: 70000),
    Bank(name: 'BDL', value: 3244420),
    Bank(name: 'Cash', value: 20000),
  ];

  int get sum =>
      banks[0].value + banks[1].value + banks[2].value + banks[3].value;

  double get zakat => sum * .025;
}

class Bank {
  String name;
  int value;
  Bank({
    required this.name,
    required this.value,
  });

  Bank copyWith({
    String? name,
    int? value,
  }) {
    return Bank(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }

  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
      name: map['name'] as String,
      value: map['value'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Bank.fromJson(String source) =>
      Bank.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Bank(name: $name, value: $value)';

  @override
  bool operator ==(covariant Bank other) {
    if (identical(this, other)) return true;

    return other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
