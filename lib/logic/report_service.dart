import 'package:smart_ahwa_manager_app/models/order.dart';

class ReportService {
  void generateReport(List<Order> orders) {
    print("Total orders: ${orders.length}");

    var countMap = drinkCount(orders);

    if (countMap.isNotEmpty) {
      var topDrink = countMap.entries.reduce((a, b) => a.value > b.value ? a : b);
      print("Most popular drink is ${topDrink.key}");
    }
  }

  Map<String, int> drinkCount(List<Order> orders) {
    Map<String, int> countMap = {};
    for (var order in orders) {
      String drinkName = order.drink.name;
      if (countMap.containsKey(drinkName)) {
        countMap[drinkName] = countMap[drinkName]! + 1;
      } else {
        countMap[drinkName] = 1;
      }
    }
    return countMap;
}
}