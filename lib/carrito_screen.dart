import 'package:flutter/material.dart';
import 'data_store.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {

  double calcularTotal() {
    double total = 0;

    for (var producto in DataStore.carrito) {
      total += double.parse(
        producto["precio"].toString().replaceAll(".", ""),
      );
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Mi Carrito",
          style: TextStyle(
            color: Color(0xFF00A2FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Expanded(
              child: DataStore.carrito.isEmpty
                  ? const Center(
                child: Text(
                  "🛒 Carrito vacío",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: DataStore.carrito.length,
                itemBuilder: (context, index) {

                  final producto =
                  DataStore.carrito[index];

                  return Card(
                    color: Colors.black54,
                    child: ListTile(

                      leading: Image.asset(
                        producto["imagen"],
                        width: 60,
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

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {

                          setState(() {
                            DataStore.carrito.removeAt(
                              index,
                            );
                          });

                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "TOTAL: \$${calcularTotal().toStringAsFixed(0)}",
              style: const TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF00A2FF),
                ),

                onPressed: () {

                  if (DataStore.carrito.isEmpty) {

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "El carrito está vacío",
                        ),
                      ),
                    );

                    return;
                  }

                  DataStore.historial.addAll(
                    DataStore.carrito,
                  );

                  DataStore.carrito.clear();

                  setState(() {});

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "✅ Compra realizada correctamente",
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                },

                child: const Text(
                  "FINALIZAR COMPRA",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}