import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kobe_rick_and_morty_challenge/widgets/app_barwidget.dart';

void main() {
  testWidgets('verifica icones e título da app bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppBarwidget(
            showBackButton: false,
            title: 'titulo teste',
            showProfileButton: true,
          ),
        ),
      ),
    );

    expect(find.text('título teste'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_sharp), findsOneWidget);
  });

  testWidgets('sem icon perfil e com botão voltar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppBarwidget(
            showBackButton: true,
            title: 'outro titulo',
            showProfileButton: false,
          ),
        ),
      ),
    );

    expect(find.text('outro titulo'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_sharp), findsNothing);
  });
}
