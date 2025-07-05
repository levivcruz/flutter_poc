import 'package:flutter_poc_bm/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify initial counter is 0 and increment works',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify the initial counter is 0
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the increment button and trigger a frame
      await tester.tap(find.byTooltip('Increment'));
      await tester.pumpAndSettle();

      // Verify the counter has incremented
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('verify app UI elements are present', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify AppBar title
      expect(find.text('Flutter Demo Home Page'), findsOneWidget);

      // Verify the counter text is present
      expect(
        find.text('You have pushed the button this many times:'),
        findsOneWidget,
      );

      // Verify FAB is present
      expect(find.byTooltip('Increment'), findsOneWidget);
    });
  });
}
