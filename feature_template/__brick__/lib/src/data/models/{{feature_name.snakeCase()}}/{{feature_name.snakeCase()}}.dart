import 'package:freezed_annotation/freezed_annotation.dart';

part '{{feature_name.snakeCase()}}.freezed.dart';
part '{{feature_name.snakeCase()}}.g.dart';

@freezed
class {{feature_name.pascalCase()}} with _${{feature_name.pascalCase()}} {
  factory {{feature_name.pascalCase()}}() = _{{feature_name.pascalCase()}};

  factory {{feature_name.pascalCase()}}.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}FromJson(json);
}
