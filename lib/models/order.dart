import 'package:smart_ahwa_manager_app/models/drink.dart';

class Order {
  String? customerName;
  Drink drink; // Drink is the abstract class
  String? notes; // optional
  bool isCompleted = false;

  Order({this.customerName, required this.drink, this.notes});

  void add(Order order) {}
}
