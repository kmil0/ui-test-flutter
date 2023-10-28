import 'package:app_sso/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    nativeAutomation: true,
    ($) async {
      await Firebase.initializeApp();
      await $.pumpWidgetAndSettle(const MyApp());

      expect($('Flutter Demo Home Page'), findsOneWidget);
      await $.tester.tap(find.text('Sign in'));
      await $.native.tap(Selector(textContains: 'camilo@oot.live'));
      await $.pumpAndSettle();
    },
  );
}
