import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF1C1B1F),
      ),
      backgroundColor: const Color(0xFF121212),
      body: const Center(
        child: Text(
          'Informações do Perfil',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
