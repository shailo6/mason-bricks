import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  context.logger.info('✅ Post-gen hook is running...');

  final featureName = context.vars['feature_name'] as String;
  final featureSnakeCase = _toSnakeCase(featureName);
  final featurePascalCase = _toPascalCase(featureName);

  final updates = {
    'lib/src/data/repositories/repositories.dart':
        "export '${featureSnakeCase}_repository.dart';",
    'lib/src/business_logic/cubits.dart':
        "export '$featureSnakeCase/${featureSnakeCase}_cubit.dart';",
    'lib/src/data/api_providers/implementations/implementations.dart':
        "export '${featureSnakeCase}_provider.dart';",
    'lib/src/data/api_providers/interface/interface.dart':
        "export 'i_${featureSnakeCase}_provider.dart';",
  };

  // Update the export statements in the files
  for (var entry in updates.entries) {
    final filePath = entry.key;
    final newExport = entry.value;
    final file = File(filePath);

    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (!content.contains(newExport)) {
        file.writeAsStringSync('$content\n$newExport\n');
        context.logger.info('✅ Updated $filePath with new export.');
      } else {
        context.logger.info('⚠️ Export already exists in $filePath, skipping.');
      }
    } else {
      context.logger.warn('❌ $filePath not found, skipping export update.');
    }
  }

  // Add mock class to mock_classes.dart
  final mockClassesPath = 'test/widget/common_setup/mock_classes.dart';
  final mockClassesFile = File(mockClassesPath);

  if (mockClassesFile.existsSync()) {
    final mockClassName = 'Mock${featurePascalCase}Repository';
    final mockClassContent =
        'class $mockClassName extends Mock implements ${featurePascalCase}Repository {}';
    final currentContent = mockClassesFile.readAsStringSync();

    if (!currentContent.contains(mockClassName)) {
      mockClassesFile.writeAsStringSync('$currentContent\n$mockClassContent\n');
      context.logger.info('✅ Added $mockClassName to $mockClassesPath.');
    } else {
      context.logger.info(
          '⚠️ $mockClassName already exists in $mockClassesPath, skipping.');
    }
  } else {
    context.logger
        .warn('❌ $mockClassesPath not found, skipping mock class update.');
  }

  context.logger.success('🎉 Post-gen hook finished.');
}

/// Convert PascalCase to snake_case
String _toSnakeCase(String str) {
  return str
      .replaceAllMapped(RegExp(r'([a-z])([A-Z])'),
          (match) => '${match.group(1)}_${match.group(2)}')
      .toLowerCase();
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
