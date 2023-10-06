// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Transaction {
  final int id;
  // final String status;
  final double amount;
  // final double? amountRefund;
  // final int? clientId;
  // final String? clientFirstName;
  // final String? clientLastName;
  final String type;
  final DateTime transactionDate;
  // final String merchantFirstName;
  // final String merchantLastName;
  // final int merchantId;
  // final String merchantWilayaName;
  // final int merchantWilayaId;
  // final String merchantPhone;
  // final String merchantCommune;
  final String? orderId;

  Transaction({
    required this.id,
    // required this.status,
    required this.amount,
    // this.amountRefund,
    // this.clientId,
    // this.clientFirstName,
    // this.clientLastName,
    required this.type,
    required this.transactionDate,
    // required this.merchantFirstName,
    // required this.merchantLastName,
    // required this.merchantId,
    // required this.merchantWilayaName,
    // required this.merchantWilayaId,
    // required this.merchantPhone,
    // required this.merchantCommune,
    this.orderId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      // status: json['status'],
      amount: json['amount'],
      // amountRefund: json['amountRefund'],
      // clientId: json['clientId'],
      // clientFirstName: json['clientFirstName'],
      // clientLastName: json['clientLastName'],
      type: json['type'],
      transactionDate: DateTime.parse(json['transactionDate']),
      // merchantFirstName: json['merchantFirstName'],
      // merchantLastName: json['merchantLastName'],
      // merchantId: json['merchantId'],
      // merchantWilayaName: json['merchantWilayaName'],
      // merchantWilayaId: json['merchantWilayaId'],
      // merchantPhone: json['merchantPhone'],
      // merchantCommune: json['merchantCommune'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'type': type,
      'date': transactionDate.toString(),
      'orderId': orderId,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as int,
      amount: map['amount'] as double,
      type: map['type'] as String,
      transactionDate:
          DateTime.fromMillisecondsSinceEpoch(map['transactionDate'] as int),
      orderId: map['orderId'] != null ? map['orderId'] as String : null,
    );
  }
}
