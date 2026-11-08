import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MarketPremiumApp());
}

class MarketPremiumApp extends StatelessWidget {
  const MarketPremiumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Market Premium',
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> validarLogin() async {

    final prefs = await SharedPreferences.getInstance();

    String correoGuardado =
        prefs.getString("correo") ?? "";

    String passwordGuardada =
        prefs.getString("password") ?? "";

    if (
    correoController.text.trim() == correoGuardado &&
        passwordController.text.trim() == passwordGuardada
    ) {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "❌ Correo o contraseña incorrectos",
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 550,
            ),
            padding: const EdgeInsets.all(25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 220,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "MARKET PREMIUM",
                  style: TextStyle(
                    color: Color(0xFF00A2FF),
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Tu mundo, sin límites",
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: correoController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Correo electrónico",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color(0xFF00A2FF),
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xFFD4AF37),
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A2FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: validarLogin,
                    child: const Text(
                      "INGRESAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "CREAR CUENTA",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}