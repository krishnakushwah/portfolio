import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio landing page renders core content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter Developer • 3 Years Experience'), findsOneWidget);
    expect(find.text('Krishna'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
  });
}
