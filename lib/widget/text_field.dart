import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   final TextEditingController? controller;
  const CustomTextField({super.key, required this.hintText, required this.controller});
  final String hintText ;
  @override
  Widget build(BuildContext context) {
    return  Container(
                height: 45,
                width: 300,
                child: TextFormField(
                   controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              );
  }
}