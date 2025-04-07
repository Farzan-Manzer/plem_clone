import 'package:flutter/material.dart';
import '../components/gradient_button.dart';
import '../components/phone_input_field.dart';
import '../components/login_screen_components/carousel_slider/carousel_slider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: const HorizontalCarouselSlider(),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const PhoneInputField(),
                    const SizedBox(height: 20),
                    GradientButton(text: "start PLEM’ing >>>", onTap: () {}),
                    const SizedBox(height: 16),
                    const Text.rich(
                      TextSpan(
                        text: 'by continuing you agree to our ',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                        children: [
                          TextSpan(
                            text: 'terms & conditions',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: ' & ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: 'privacy policy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
