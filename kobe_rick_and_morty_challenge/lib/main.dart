import 'package:flutter/material.dart';
import 'features/character_list/views/character_list_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFF1C1B1F),        
      onPrimary: const Color(0xFFFFFFFF),     
      secondary: const Color(0xFF87A1FA),      
      onSecondary: const Color(0xFF000000),   
      background: const Color(0xFF000000),    
      onBackground: const Color(0xFFFFFFFF),   
      surface: const Color(0xFF87A1FA),       
      onSurface: const Color(0xFFFFFFFF),     
      error: Colors.red,
      onError: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: colorScheme.secondary,
          shadowColor: Colors.black54,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: colorScheme.onBackground),
          titleMedium: TextStyle(color: colorScheme.onSurface),
        ),
      ),
      home: const CharacterListScreen(),
    );
  }
}
