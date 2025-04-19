import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/utils/custom_app_bar.dart';
import 'package:greengrocer/src/pages/utils/custom_text_field.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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
                onPressed: () {},
                child: const Text('Alterar senha'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
