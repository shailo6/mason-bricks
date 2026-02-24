import 'package:mason/mason.dart';

void run(HookContext context) {
  var featureName = context.vars['feature_name'] as String?;

  if (featureName == null || featureName.isEmpty) {
    throw Exception('feature_name is required');
  }

  // Check if feature_name is in PascalCase, if not convert it
  final pascalCaseFeatureName = _toPascalCase(featureName);

  if (featureName != pascalCaseFeatureName) {
    context.logger.warn(
      '⚠️ feature_name should be in PascalCase. Converting "$featureName" to "$pascalCaseFeatureName"',
    );
    context.vars['feature_name'] = pascalCaseFeatureName;
  }

  context.logger
      .info('✅ Pre-gen validation passed for: ${context.vars['feature_name']}');
}

/// Convert any case to PascalCase
String _toPascalCase(String str) {
  return str
      .split(RegExp(r'[_\-\s]+|(?<=[a-z])(?=[A-Z])'))
      .map((word) => word.isEmpty
          ? ''
          : word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join();
}
