import 'package:flutter/material.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    usernameController.text = 'admin';
    passwordController.text = '123456';
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return FractionallySizedBox(
                widthFactor: constraints.maxWidth > 600 ? 0.5 : 1.0,
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/lotties/welcome.json',
                      width: double.infinity,
                      height: 300.0,
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FilledButton(
                      onPressed: () {
                        onLoginPressed();
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                      ),
                      child: Text(widget.title),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (usernameController.text == 'admin' &&
        passwordController.text == '123456') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WidgetTree()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid credentials',
            style: TextStyle(color: Colors.white54),
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromARGB(255, 0, 96, 87),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
