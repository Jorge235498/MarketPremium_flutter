import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'catalogo_screen.dart';
import 'carrito_screen.dart';
import 'perfil_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),

      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.black,

        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 60,
            ),

            const Spacer(),

            TextButton(
              onPressed: () {},
              child: const Text(
                "INICIO",
                style: TextStyle(
                  color: Color(0xFF00A2FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CatalogoScreen(),
                  ),
                );
              },
              child: const Text(
                "CATÁLOGO",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CarritoScreen(),
                  ),
                );
              },
              child: const Text(
                "CARRITO",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PerfilScreen(),
                  ),
                );
              },
              child: const Text(
                "PERFIL",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            TextButton(
              onPressed: () async {
                bool? salir = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF111111),

                      title: const Text(
                        "Cerrar sesión",
                        style: TextStyle(
                          color: Color(0xFF00A2FF),
                        ),
                      ),

                      content: const Text(
                        "¿Está seguro que desea cerrar sesión?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Color(0xFFD4AF37),
                            ),
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.popUntil(
                              context,
                                  (route) => route.isFirst,
                            );
                          },
                          child: const Text(
                            "Salir",
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                "CERRAR SESIÓN",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 20),

              Image.asset(
                'assets/images/logo.png',
                height: 140,
              ),

              const SizedBox(height: 20),

              const Text(
                "BIENVENIDO A MARKET PREMIUM",
                style: TextStyle(
                  color: Color(0xFF00A2FF),
                  fontSize: 30,
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

              const SizedBox(height: 30),

              CarouselSlider(
                options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  autoPlayInterval:
                  const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: [

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/banner1.jpg",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/banner2.jpg",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),

                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/banner3.jpg",
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}