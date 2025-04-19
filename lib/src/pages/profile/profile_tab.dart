import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/utils/custom_app_bar.dart';
import 'package:greengrocer/src/pages/utils/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Perfil"),
      body: Card(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            // Nome
            CustomTextField(
              icon: Icons.person,
              label: 'Nome',
              defaultValue: app_data.userModel.name,
              isReadOnly: true,
            ),

            // Email
            CustomTextField(
              icon: Icons.email,
              label: 'Email',
              defaultValue: app_data.userModel.email,
              isReadOnly: true,
            ),

            // Celular
            CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              defaultValue: app_data.userModel.phone,
              isReadOnly: true,
            ),

            // CPF
            CustomTextField(
              icon: Icons.file_copy,
              label: 'CPF',
              defaultValue: app_data.userModel.cpf,
              isReadOnly: true,
            ),

            // Alterar senha
            SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: const BorderSide(color: Colors.green),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: const Text('Alterar senha'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (content) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Titulo
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Senha atual
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha atual',
                      isPassword: true,
                    ),

                    // Nova senha
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Nova senha',
                      isPassword: true,
                    ),

                    // Confirmar nova senha
                    CustomTextField(
                      icon: Icons.lock_outline,
                      label: 'Confirmar nova senha',
                      isPassword: true,
                    ),

                    // Botão de atualizar senha
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Botão de fechar
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
