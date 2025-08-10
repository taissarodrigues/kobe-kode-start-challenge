import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_profile_widget.dart';

import 'package:kobe_rick_and_morty_challenge/widgets/app_profile_widget.dart';

class AppBarwidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF1C1B1F),
        height: preferredSize.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.6, top: 22.72),
              child: InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu, color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/imagens/code_start_logo.png'),
                  height: 76.99,
                ),
                const SizedBox(height: 6),
                Text(
                  'RICK AND MORTY API',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ],
            ),
            // AQUI ESTÁ A MUDANÇA PARA O ÍCONE DE PERFIL
            Padding(
              padding: const EdgeInsets.only(right: 16.6, top: 22.72),
              child: InkWell(
                onTap: () {
                  // Ação para navegar para a tela de perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileWidget(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.account_circle_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(131);
}
