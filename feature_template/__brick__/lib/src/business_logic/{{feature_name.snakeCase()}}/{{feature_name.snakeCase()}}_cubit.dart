import 'package:equatable/equatable.dart';
import 'package:fusiongoapp/src/business_logic/custom_cubit_base.dart';
import 'package:fusiongoapp/src/data/repositories/repositories.dart';

part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends CustomCubitBase<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Cubit({
    required this.{{feature_name.camelCase()}}Repository,
  }) : super(const {{feature_name.pascalCase()}}State());

  final {{feature_name.pascalCase()}}Repository {{feature_name.camelCase()}}Repository;
}
