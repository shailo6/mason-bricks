import 'package:fusiongoapp/src/data/api_providers/interface/interface.dart';

class {{feature_name.pascalCase()}}Repository {
  {{feature_name.pascalCase()}}Repository({required this.{{feature_name.camelCase()}}Provider});

  final I{{feature_name.pascalCase()}}Provider {{feature_name.camelCase()}}Provider;
}
