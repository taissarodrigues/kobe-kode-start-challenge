import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kobe_rick_and_morty_challenge/pages/character_list_screen.dart';
import 'package:kobe_rick_and_morty_challenge/pages/about_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context);

    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != routeName) {
      Navigator.pushNamed(context, routeName);
    }
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF121212),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1C1B1F)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Rick and Morty',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _drawerItem(
            icon: Icons.people,
            text: 'Characters',
            onTap: () => _navigateTo(context, CharacterListScreen.routeId),
          ),
          _drawerItem(
            icon: Icons.info_outline,
            text: 'About',
            onTap: () => _navigateTo(context, AboutScreen.routeId),
          ),
        ],
      ),
    );
  }
}
