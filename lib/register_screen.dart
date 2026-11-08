import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_store.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmarController = TextEditingController();

  Future<void> registrarUsuario() async {

    if (passwordController.text != confirmarController.text) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Las contraseñas no coinciden",
          ),
        ),
      );

      return;
    }

    final prefs = await SharedPreferences.getInstance();

    // BORRAR DATOS ANTERIORES
    await prefs.clear();

    // BORRAR CARRITO ANTERIOR
    DataStore.carrito.clear();

    // BORRAR HISTORIAL ANTERIOR
    DataStore.historial.clear();

    await prefs.setString(
      "nombre",
      nombreController.text.trim(),
    );

    await prefs.setString(
      "apellido",
      apellidoController.text.trim(),
    );

    await prefs.setString(
      "correo",
      correoController.text.trim(),
    );

    await prefs.setString(
      "password",
      passwordController.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "✅ Usuario registrado correctamente",
        ),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFF00A2FF),
        ),
        title: const Text(
          "Registro",
          style: TextStyle(
            color: Color(0xFF00A2FF),
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 550,
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [

                Image.asset(
                  'assets/images/logo.png',
                  height: 180,
                ),

                const SizedBox(height: 20),

                const Text(
                  "CREAR CUENTA",
                  style: TextStyle(
                    color: Color(0xFF00A2FF),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Únete a Market Premium",
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: nombreController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "nombre",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFF00A2FF),
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: apellidoController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "apellido",
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFFD4AF37),
                    ),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: correoController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Correo electrónico",
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

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Contraseña",
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

                const SizedBox(height: 15),

                TextField(
                  controller: confirmarController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Confirmar contraseña",
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF00A2FF),
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
                      backgroundColor: const Color(0xFFD4AF37),
                    ),
                    onPressed: registrarUsuario,
                    child: const Text(
                      "REGISTRARME",
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