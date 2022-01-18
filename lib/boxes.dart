import 'package:hive/hive.dart';
import 'package:zireh_demo/Model/transaction.dart';

class Boxes {
  static Box<Transaction> getTransactions() =>
      Hive.box<Transaction>('transactions');
}
