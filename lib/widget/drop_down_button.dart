import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;

  const DropDownButton({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final List<String> drinks = const [
    'Tea',
    'Turkish Coffee',
    'Hibiscus',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        hint: const Text("  select drink"),
        value: value, 
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(16),
        items: drinks.map((String drink) {
          return DropdownMenuItem<String>(
            value: drink,
            child: Text(drink),
          );
        }).toList(),
        onChanged: onChanged, 
    ),
);
}
}