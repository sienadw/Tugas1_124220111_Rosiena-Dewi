import 'package:flutter/material.dart'; //ketik STL

class LoginPage extends StatefulWidget {
  const LoginPage({super.key}); // Use const for better performance

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'), // Use const for static text
          backgroundColor: const Color.fromARGB(255, 130, 211, 255), // Light blue for app bar
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 111, 202, 255), // Light teal
                Color.fromARGB(255, 0, 46, 106), // Teal
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content
            children: [
              usernameField(),
              passwordField(),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        enabled: true,
        decoration: InputDecoration(
          labelText: 'Username',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Teal border
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: visible,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
              });
            },
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)), // Teal border
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'rosiena' && password == '124220111') {
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }

          SnackBar snackBar = SnackBar(
            backgroundColor: isLoginSuccess ? const Color.fromARGB(255, 59, 255, 105) : Colors.redAccent, // Teal for success, red for failure
            content: Text(text),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Teal button color
        ),
      ),
    );
  }
}