 import 'package:smart_ahwa_manager_app/models/order.dart';

class OrderManager {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
  }

  void completeOrder(int index) {
    if (index >= 0 && index < orders.length) {
      orders[index].isCompleted = true;
    }
  }
  List<Order> get pendingOrders =>
      orders.where((order) => !order.isCompleted).toList();
 }