import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/lotties/business-team.json',
                  width: double.infinity,
                ),
                Text(
                  'Welcome to the Flutter Map App, let\'s start by creating your account',
                  style: kTextStyle.descriptionText,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () {
                    onContinuePressed(context);
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onContinuePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(title: 'Register')),
    );
  }
}
