import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String?hintText;
  double?maxHeight;
  double?maxWidth;
  ValueChanged?onValueChanged;
  TextEditingController? controller;
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onValueChanged,
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        constraints: BoxConstraints(
          maxHeight: maxHeight??40,
          maxWidth: maxWidth??300,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5)
        ),
        enabled: true,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(5)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }
}
