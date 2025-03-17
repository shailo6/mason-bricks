
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fusiongoapp/src/business_logic/cubits.dart';
import 'package:fusiongoapp/src/ui/screens/{{widget_name.snakeCase()}}/{{widget_name.snakeCase()}}_home.dart';
import '../../common_setup/mock_classes.dart';
import '../../dependency_injection_mock.dart';
import '../../widget_test_app_config.dart';


void main() {
  late Widget {{widget_name.camelCase()}}Screen;

  setUp(() {
    {{widget_name.camelCase()}}Screen = BlocProvider<{{widget_name.pascalCase()}}Cubit>(
      create: (context) => {{widget_name.pascalCase()}}Cubit(
        {{widget_name.camelCase()}}Repository: Mock{{widget_name.pascalCase()}}Repository(),
      ),
      child: FusionWidgetTest.widgetTestApp(home: {{widget_name.pascalCase()}}Screen()),
    );
  });

  group('{{widget_name.sentenceCase()}} Screen', () {
    testWidgets('--> Check Build Structure', (WidgetTester tester) async {
      GlobalBindingMock.initialize();
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget({{widget_name.camelCase()}}Screen);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byKey(const ValueKey('{{widget_name.camelCase()}}')), findsOneWidget);
      GlobalBindingMock.dispose();
    });
  });
}

