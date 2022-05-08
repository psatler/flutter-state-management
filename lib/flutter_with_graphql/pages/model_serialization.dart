import 'dart:convert';

// json response

// {
//   "data": {
//     "addCategory": {
//       "name": "test2"
//     }
//   }
// }

class AddCategoryModel {
  final String typename;
  final AddCategoryModelInner addCategory;

  AddCategoryModel({
    required this.typename,
    required this.addCategory,
  });

  Map<String, dynamic> toMap() {
    return {
      '__typename': typename,
      'addCategory': addCategory.toMap(),
    };
  }

  factory AddCategoryModel.fromMap(Map<String, dynamic> map) {
    return AddCategoryModel(
      typename: map['__typename'] ?? '',
      addCategory: AddCategoryModelInner.fromMap(map['addCategory']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCategoryModel.fromJson(String source) =>
      AddCategoryModel.fromMap(json.decode(source));
}

class AddCategoryModelInner {
  final String typename;
  final String name;

  AddCategoryModelInner({
    required this.typename,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      '__typename': typename,
      'name': name,
    };
  }

  factory AddCategoryModelInner.fromMap(Map<String, dynamic> map) {
    return AddCategoryModelInner(
      typename: map['__typename'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCategoryModelInner.fromJson(String source) =>
      AddCategoryModelInner.fromMap(json.decode(source));
}
