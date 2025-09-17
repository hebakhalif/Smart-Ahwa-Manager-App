import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/models/order.dart';
import 'package:smart_ahwa_manager_app/models/drink.dart';
import 'package:smart_ahwa_manager_app/widget/text_field.dart';
import 'package:smart_ahwa_manager_app/widget/drop_down_button.dart';

class AddOrderScreen extends StatefulWidget {
  final void Function(Order) onAddOrder;

  const AddOrderScreen({super.key, required this.onAddOrder});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String? _selectedDrink;

  Drink _mapDrink(String name) {
    switch (name) {
      case 'Tea':
        return Tea();
      case 'Turkish Coffee':
        return Coffee();
      case 'Hibiscus':
        return Hibiscus();
      default:
        return Tea();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
      child: Container(
        width: 340,
        height: 300,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add New Order"),
              const SizedBox(height: 20),
              const Text("Customer name"),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Enter Customer name",
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              const Text("Drink Type"),
              const SizedBox(height: 10),
              DropDownButton(
                value: _selectedDrink,
                onChanged: (val) {
                  setState(() {
                    _selectedDrink = val;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text("Special Instructions (Optional)"),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "Any special requests...",
                controller: _notesController,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (_nameController.text.isNotEmpty &&
                      _selectedDrink != null) {
                    final newOrder = Order(
                      customerName: _nameController.text,
                      drink: _mapDrink(_selectedDrink!),
                      notes: _notesController.text,
                    );

                    widget.onAddOrder(newOrder);
                    _nameController.clear();
                    _notesController.clear();
                    setState(() => _selectedDrink = null);

                   
                    
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill name and drink'),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Add Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
