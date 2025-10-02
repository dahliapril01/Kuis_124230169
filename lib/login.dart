import 'package:flutter/material.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool loginBerhasil = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1E1E2C),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.food_bank_rounded,
                        color: const Color.fromARGB(255, 255, 191, 0),
                        size: 50,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  _usernameField(),
                  const SizedBox(height: 20),

                  _passwordField(),
                  const SizedBox(height: 30),

                  _loginButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _username,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1E1E2C),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 255, 191, 0),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _password,
      obscureText: _obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1E1E2C),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 255, 191, 0),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          String text = "";
          if (_username.text == "Dahlia" && _password.text == "169") {
            setState(() {
              text = "Login Berhasil";
              loginBerhasil = true;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(username: _username.text),
                ),
              );
            });
          } else {
            setState(() {
              text = "Login Gagal";
              loginBerhasil = false;
            });
          }
          SnackBar snack = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snack);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 191, 0),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Log In',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
