import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/logic/report_service.dart';
import 'package:smart_ahwa_manager_app/models/order.dart';

class ReportScreen extends StatelessWidget {
  final List<Order> orders;
  final ReportService reportService = ReportService();

  ReportScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final totalOrders = orders.length;
    final completedOrders = orders.where((o) => o.isCompleted).length;
    final pendingOrders = orders.where((o) => !o.isCompleted).length;
    final drinkCounts = reportService.drinkCount(orders);

    String? mostPopularDrink;
    if (drinkCounts.isNotEmpty) {
      mostPopularDrink =
          drinkCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Row(
            children: const [
              Icon(Icons.bar_chart, color: Colors.black54),
              Text("Reports & Analytics", style: TextStyle(fontSize: 17)),
            ],
          ),

          _buildReportTile(
            "Total Orders",
            totalOrders.toString(),
            "All orders added",
          ),
          _buildReportTile(
            "Completed Orders",
            completedOrders.toString(),
            "Orders marked as done",
          ),
          _buildReportTile(
            "Pending Orders",
            pendingOrders.toString(),
            "Still not completed",
          ),
          if (mostPopularDrink != null)
            _buildReportTile(
              "Most Popular Drink",
              mostPopularDrink,
              "Based on total orders",
            ),
        ],
      ),
    );
  }

  Widget _buildReportTile(String title, String value, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          const Icon(Icons.bar_chart, color: Colors.black38),
        ],
      ),
    );
  }
}
