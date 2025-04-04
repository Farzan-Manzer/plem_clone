import 'package:flutter/material.dart';
import '../components/gradient_button.dart';
import '../components/phone_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.flash_on,
                                color: Colors.deepOrange,
                                size: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'earn upto ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '500% PLEMs',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        foreground:
                                            Paint()
                                              ..shader = const LinearGradient(
                                                colors: [
                                                  Color(0xFFFF512F),
                                                  Color(0xFFDD2476),
                                                ],
                                              ).createShader(
                                                const Rect.fromLTWH(
                                                  0.0,
                                                  0.0,
                                                  200.0,
                                                  70.0,
                                                ),
                                              ),
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' on all spends',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          'and get bonus PLEMs on every visit\n',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'ab har roz rewards kamao',
                                      style: TextStyle(
                                        fontSize: 14,
                                        foreground:
                                            Paint()
                                              ..shader = const LinearGradient(
                                                colors: [
                                                  Color(0xFFFF512F),
                                                  Color(0xFFDD2476),
                                                ],
                                              ).createShader(
                                                const Rect.fromLTWH(
                                                  0.0,
                                                  0.0,
                                                  200.0,
                                                  70.0,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const PhoneInputField(),
                              const SizedBox(height: 20),
                              GradientButton(
                                text: "start PLEM’ing >>>",
                                onTap: () {},
                              ),
                              const SizedBox(height: 16),
                              Text.rich(
                                TextSpan(
                                  text: 'by continuing you agree to our ',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'terms & conditions',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' & ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: 'privacy policy',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
