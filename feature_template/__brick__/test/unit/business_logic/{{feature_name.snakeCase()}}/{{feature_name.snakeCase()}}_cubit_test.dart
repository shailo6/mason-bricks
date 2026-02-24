import 'package:flutter_test/flutter_test.dart';
import 'package:fusiongoapp/src/business_logic/cubits.dart';
import '../../../widget/common_setup/mock_classes.dart';


void main() {
  late Mock{{feature_name.pascalCase()}}Repository mock{{feature_name.camelCase()}}Repository;
  late {{feature_name.pascalCase()}}Cubit {{feature_name.camelCase()}}Cubit;

  setUp(() async{
    TestWidgetsFlutterBinding.ensureInitialized();
    mock{{feature_name.camelCase()}}Repository = Mock{{feature_name.pascalCase()}}Repository();

    {{feature_name.camelCase()}}Cubit = {{feature_name.pascalCase()}}Cubit(
      {{feature_name.camelCase()}}Repository: mock{{feature_name.camelCase()}}Repository,
    );
  });

  group('{{feature_name.sentenceCase()}}', () {
    test('testing {{feature_name.camelCase()}}', () {
      expect({{feature_name.camelCase()}}Cubit.loading, 'loading');
    });
  });
}
