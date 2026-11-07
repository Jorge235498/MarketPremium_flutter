import 'package:flutter/material.dart';
import 'data_store.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Catálogo Premium",
          style: TextStyle(
            color: Color(0xFF00A2FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.65,
          children: [

            producto(
              context,
              "Nike Air Max",
              "299.900",
              "assets/images/nike.jpg",
            ),

            producto(
              context,
              "Adidas Forum",
              "259.900",
              "assets/images/adidas.jpg",
            ),

            producto(
              context,
              "Jordan 1",
              "399.900",
              "assets/images/jordan.jpg",
            ),

            producto(
              context,
              "Puma RS-X",
              "219.900",
              "assets/images/puma.jpg",
            ),

            producto(
              context,
              "Gaming Headset",
              "189.900",
              "assets/images/headset.jpg",
            ),

            producto(
              context,
              "Smart Watch",
              "449.900",
              "assets/images/watch.jpg",
            ),
          ],
        ),
      ),
    );
  }

  Widget producto(
      BuildContext context,
      String nombre,
      String precio,
      String imagen,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD4AF37),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(
            imagen,
            height: 220,
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 15),

          Text(
            nombre,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "\$$precio",
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00A2FF),
            ),
            onPressed: () {

              DataStore.carrito.add({
                "nombre": nombre,
                "precio": precio,
                "imagen": imagen,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "$nombre agregado al carrito",
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              "Agregar al carrito",
            ),
          ),
        ],
      ),
    );
  }
}