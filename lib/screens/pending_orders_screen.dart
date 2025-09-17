import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/models/order.dart';

class PendingOrdersScreen extends StatelessWidget {
  final List<Order> orders;

  const PendingOrdersScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child:
          orders.isEmpty
              ? const Center(
                child: Text(
                  "No pending orders yet \n     All caught up! 🎉",
                  style: TextStyle(fontSize: 15),
                ),
              )
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.customerName ?? "Unknown",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(order.drink.name),
                            if (order.notes != null && order.notes!.isNotEmpty)
                              Text(
                                "Notes: ${order.notes!}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Completed",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
