import 'package:flutter/material.dart';

class PhoneInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;

  const PhoneInputField({
    super.key,
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
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white12),
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/indian_flag.png',
                    width: 20,
                    height: 14,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '+91',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Container(
                width: 1,
                height: 40, // full height of the row
                color: Colors.white24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Color(0xFF33363E),
                      letterSpacing: 4,
                    ),
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
