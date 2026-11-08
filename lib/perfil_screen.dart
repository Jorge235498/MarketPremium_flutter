import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data_store.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  String nombre = "";
  String apellido = "";
  String correo = "";

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final correoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarDatos();
  }

  Future<void> cargarDatos() async {

    final prefs = await SharedPreferences.getInstance();

    nombre = prefs.getString("nombre") ?? "";
    apellido = prefs.getString("apellido") ?? "";
    correo = prefs.getString("correo") ?? "";

    print("Nombres: $nombre");
    print("Apellidos: $apellido");
    print("Correo: $correo");

    nombreController.text = nombre;
    apellidoController.text = apellido;
    correoController.text = correo;

    setState(() {});
  }

  Future<void> guardarCambios() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "nombre",
      nombreController.text,
    );

    await prefs.setString(
      "apellido",
      apellidoController.text,
    );

    await prefs.setString(
      "correo",
      correoController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "✅ Perfil actualizado",
        ),
      ),
    );

    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Mi Perfil",
          style: TextStyle(
            color: Color(0xFF00A2FF),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Icon(
              Icons.person,
              size: 120,
              color: Color(0xFF00A2FF),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nombreController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                labelText: "Nombres",
                labelStyle: TextStyle(
                  color: Color(0xFFD4AF37),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: apellidoController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                labelText: "Apellidos",
                labelStyle: TextStyle(
                  color: Color(0xFFD4AF37),
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: correoController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                labelText: "Correo",
                labelStyle: TextStyle(
                  color: Color(0xFFD4AF37),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 250,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A2FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                onPressed: guardarCambios,
                child: const Text(
                  "GUARDAR CAMBIOS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Historial de Compras",
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            if (DataStore.historial.isEmpty)
              const Text(
                "No hay compras registradas",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

            ...DataStore.historial.map(
                  (producto) {

                return Card(
                  color: Colors.black54,

                  child: ListTile(
                    leading: Image.asset(
                      producto["imagen"],
                      width: 50,
                    ),

                    title: Text(
                      producto["nombre"],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    subtitle: Text(
                      "\$${producto["precio"]}",
                      style: const TextStyle(
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}