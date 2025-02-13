import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info('✅ Post-gen hook is running...');

  final featureName = context.vars['feature_name'] as String;
  final featureSnakeCase = featureName.toLowerCase();

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

  // Run the Flutter build_runner command
  try {
    final buildRunnerResult = await Process.run(
      'flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: Directory.current.path,
    );

    if (buildRunnerResult.exitCode == 0) {
      context.logger.success('✅ build_runner ran successfully.');
    } else {
      context.logger.err('❌ build_runner failed: ${buildRunnerResult.stderr}');
    }
  } catch (e) {
    context.logger.err('❌ Error running build_runner: $e');
  }

  // Run the Dart format command
  try {
    final formatResult = await Process.run(
      'dart',
      ['format', '.'],
      workingDirectory: Directory.current.path,
    );

    if (formatResult.exitCode == 0) {
      context.logger.success('✅ Dart format ran successfully.');
    } else {
      context.logger.err('❌ Dart format failed: ${formatResult.stderr}');
    }
  } catch (e) {
    context.logger.err('❌ Error running dart format: $e');
  }

  context.logger.success('🎉 Post-gen hook finished.');
}
