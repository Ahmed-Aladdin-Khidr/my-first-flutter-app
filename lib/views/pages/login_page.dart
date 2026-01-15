import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:flutter_app/views/widget_tree.dart';

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
          child: Column(
            children: [
              HeroWidget(title: widget.title),
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
              ElevatedButton(
                onPressed: () {
                  onLoginPressed();
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
                child: Text('Login'),
              ),
              TextButton(
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
                onPressed: () {},
                child: Text('Register'),
              ),
            ],
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
