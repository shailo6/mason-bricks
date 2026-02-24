
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fusiongoapp/src/business_logic/cubits.dart';
import 'package:fusiongoapp/src/ui/screens/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_home.dart';
import '../../widget_test_app_config.dart';
import '../../common_setup/mock_classes.dart';
import '../../dependency_injection_mock.dart';



void main() {
  late Widget {{feature_name.camelCase()}}Screen;

  setUp(() {
    {{feature_name.camelCase()}}Screen = BlocProvider<{{feature_name.pascalCase()}}Cubit>(
      create: (context) => {{feature_name.pascalCase()}}Cubit(
        {{feature_name.camelCase()}}Repository: Mock{{feature_name.pascalCase()}}Repository(),
      ),
      child: FusionWidgetTest.widgetTestApp(home: {{feature_name.pascalCase()}}Home()),
    );
  });

  group('{{feature_name.sentenceCase()}} Screen', () {
    testWidgets('--> Check Build Structure', (WidgetTester tester) async {
      GlobalBindingMock.initialize();
      tester.view.physicalSize = const Size(360, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget({{feature_name.camelCase()}}Screen);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byKey(const ValueKey('{{feature_name.camelCase()}}Home')), findsOneWidget);
      GlobalBindingMock.dispose();
    });
  });
}
