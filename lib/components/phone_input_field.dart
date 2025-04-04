import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final String countryCode;
  final TextEditingController? controller;
  final String hintText;
  final String labelText;

  const PhoneInputField({
    super.key,
    this.countryCode = '🇮🇳 +91',
    this.controller,
    this.hintText = '9810098100',
    this.labelText = 'enter mobile number',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  countryCode,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.white38),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
