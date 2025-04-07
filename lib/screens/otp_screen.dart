import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_text_field.dart';
import '../components/gradient_background.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController(
    text: '0000',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Enter OTP'),
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: otpController,
                labelText: 'Enter OTP',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text("Let's Go")),
            ],
          ),
        ),
      ),
    );
  }
}
