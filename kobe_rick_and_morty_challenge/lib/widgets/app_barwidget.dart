import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_profile_widget.dart'; 

class AppBarwidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;
  final bool showProfileButton;

  const AppBarwidget({
    super.key,
    this.showBackButton = false,
    this.title = 'RICK AND MORTY API',
    this.showProfileButton = true,
  });

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
              child: Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      if (showBackButton) {
                        Navigator.of(context).pop();
                      } else {
                        Scaffold.of(context).openDrawer();
                      }
                    },
                    child: Icon(
                      showBackButton ? Icons.arrow_back : Icons.menu,
                      color: Colors.white,
                    ),
                  );
                },
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
                  title,
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
            showProfileButton
                ? Padding(
                    padding: const EdgeInsets.only(right: 16.6, top: 22.72),
                    child: InkWell(
                      onTap: () {
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
                  )
                : const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(131);
}
