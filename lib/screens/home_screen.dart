import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/models/order.dart';
import 'package:smart_ahwa_manager_app/screens/add_order_screen.dart';
import 'package:smart_ahwa_manager_app/screens/pending_orders_screen.dart';
import 'package:smart_ahwa_manager_app/screens/report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  List<Order> orders = [];
  
  
  void addOrder(Order order) {
    setState(() {
      orders.add(order);
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PendingOrdersScreen(orders: orders),
      AddOrderScreen(
        onAddOrder: (order) {
          setState(() {
            orders.add(order);
            _selectedIndex = 0;
          });
        },
      ),
      ReportScreen(orders: orders),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  _buildTabItem("Dashboard", 0),
                  _buildTabItem("Add Order", 1),
                  _buildTabItem("Reports", 2),
                ],
              ),
            ),
            Expanded(child: pages[_selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    final bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
