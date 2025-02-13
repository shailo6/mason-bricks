import 'package:fusiongoapp/src/data/api_providers/interface/interface.dart';
import 'package:fusiongoapp/src/services/network/dio/dio_service.dart';

// coverage:ignore-start

class {{feature_name.pascalCase()}}Provider extends I{{feature_name.pascalCase()}}Provider {
  final DioService dioService;
  {{feature_name.pascalCase()}}Provider({required this.dioService});
}

// coverage:ignore-end
