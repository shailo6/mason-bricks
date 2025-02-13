import 'package:flutter/material.dart';

class {{feature_name.pascalCase()}}Home extends StatefulWidget {
  const {{feature_name.pascalCase()}}Home({super.key});

  @override
  State<{{feature_name.pascalCase()}}Home> createState() => _{{feature_name.pascalCase()}}HomeState();
}

class _{{feature_name.pascalCase()}}HomeState extends State<{{feature_name.pascalCase()}}Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const ValueKey('{{feature_name.camelCase()}}Home'),
        backgroundColor: Colors.white,
        body: Center());
  }
}
