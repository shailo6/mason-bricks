import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String?;

  if (featureName == null || featureName.isEmpty) {
    throw Exception('feature_name is required');
  }

  context.logger.info('✅ Pre-gen validation passed for: $featureName');
}
