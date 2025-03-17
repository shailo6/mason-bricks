import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fusiongoapp/src/business_logic/cubits.dart';
import 'package:fusiongoapp/src/business_logic/custom_cubit_base.dart';
import 'package:fusiongoapp/src/business_logic/{{cubit_name.snakeCase()}}/{{cubit_name.snakeCase()}}_state.dart';
import 'package:mocktail/mocktail.dart';
import '../../../widget/common_setup/mock_classes.dart';


void main() {
  late Mock{{cubit_name.pascalCase()}}Repository mock{{cubit_name.camelCase()}}Repository;
  late {{cubit_name.pascalCase()}}Cubit {{cubit_name.camelCase()}}Cubit;

  setUp(() async{
    TestWidgetsFlutterBinding.ensureInitialized();
    mock{{cubit_name.camelCase()}}Repository = Mock{{cubit_name.pascalCase()}}Repository();

    {{cubit_name.camelCase()}}Cubit = {{cubit_name.pascalCase()}}Cubit(
      {{cubit_name.camelCase()}}Repository: mock{{cubit_name.camelCase()}}Repository,
    );
  });

  group('{{cubit_name.sentenceCase()}}', () {
    blocTest<{{cubit_name.pascalCase()}}Cubit, CubitState<{{cubit_name.pascalCase()}}State>>(
      'testing {{cubit_name.snakeCase()}}',
      build: () => {{cubit_name.camelCase()}}Cubit,
      act: (cubit) => cubit.init(),
      expect: () => [
        CubitState<{{cubit_name.pascalCase()}}State>(state: {{cubit_name.pascalCase()}}State()),
        ],
      verify: (_) {
        verify(() => mock{{cubit_name.camelCase()}}Repository.init()).called(1);        
      },
    );
  });
}
