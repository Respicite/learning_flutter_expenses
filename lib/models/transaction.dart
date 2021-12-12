import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.date
  });

  String get readableDate {
    return DateFormat('EEEE d.MMMM yyyy').format(date);
  }

  String get readableAmount {
    return '${amount.toStringAsFixed(2)}€';
  }
}