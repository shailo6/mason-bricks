import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fusiongoapp/src/business_logic/cubits.dart';
import 'package:fusiongoapp/src/business_logic/custom_cubit_base.dart';
import 'package:fusiongoapp/src/business_logic/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}_state.dart';
import 'package:mocktail/mocktail.dart';
import '../../../widget/common_setup/mock_classes.dart';

class Mock{{feature_name.pascalCase()}}Repository extends Mock implements {{feature_name.pascalCase()}}Repository {}

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
    blocTest<{{feature_name.pascalCase()}}Cubit, CubitState<{{feature_name.pascalCase()}}State>>(
      'testing {{feature_name.camelCase()}}',
      build: () => {{feature_name.camelCase()}}Cubit,
      act: (cubit) => cubit.init(),
      expect: () => [
        CubitState<{{feature_name.pascalCase()}}State>(state: {{feature_name.pascalCase()}}State()),
        ],
      verify: (_) {
        verify(() => mock{{feature_name.camelCase()}}Repository.init()).called(1);        
      },
    );
  });
}
