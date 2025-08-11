import 'package:flutter/material.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_barwidget.dart';

class AboutScreen extends StatelessWidget {
  static const routeId = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(showBackButton: true),
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Este app foi criado como um desafio técnico em Flutter, consumindo a API Rick and Morty.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Tecnologias: Flutter, Dart, REST API',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white60,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 36),
              Text(
                'Versão 1.0 — Agosto 2025',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white38,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
