import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:protobuddy/database/firebase_options.dart';
import 'package:protobuddy/pages/profile_page.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  testWidgets('Profile page UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Profile(),
    ));

    // Verify that the profile page is rendered
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('My Details'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);

    // Verify that the edit button is rendered
    expect(find.text('Edit'), findsOneWidget);

    // Tap on the edit button
    await tester.tap(find.text('Edit'));
    await tester.pump();

    // Verify that the text fields are rendered after tapping edit
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify that the save button is rendered after tapping edit
    expect(find.text('Save'), findsOneWidget);
  });
}
