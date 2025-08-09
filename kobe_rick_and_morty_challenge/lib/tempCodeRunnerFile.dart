
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // Opcional: define tema escuro padrão
      ),
      home: const CharacterListScreen(),
    );
  }