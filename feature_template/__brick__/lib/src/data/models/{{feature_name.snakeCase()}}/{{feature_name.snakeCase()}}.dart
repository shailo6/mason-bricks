class {{feature_name.pascalCase()}} {
  final String id;
  final String name;

  {{feature_name.pascalCase()}}({
    required this.id,
    required this.name,
  });

  factory {{feature_name.pascalCase()}}.fromJson(Map<String, dynamic> json) {
    return {{feature_name.pascalCase()}}(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
