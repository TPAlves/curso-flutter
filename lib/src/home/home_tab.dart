import 'package:flutter/material.dart';
import 'package:greengrocer/src/auth/sign_in_screen.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundLogin,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'Acessar o carrinho',
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    'Teste...',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.blue),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          alignment: AlignmentDirectional.bottomCenter,
        ),
        title: Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Sair',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
            icon: const Icon(Icons.exit_to_app_outlined, color: Colors.white),
          ),
        ],
      ),

      // Campo de pesquisa

      // Categorias

      // Grid
    );
  }
}
