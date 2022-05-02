import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'countries.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class QueryListOfCountries {
  QueryListOfCountries({required this.countries, required this.$__typename});

  @override
  factory QueryListOfCountries.fromJson(Map<String, dynamic> json) =>
      _$QueryListOfCountriesFromJson(json);

  final List<QueryListOfCountries$countries> countries;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$QueryListOfCountriesToJson(this);
  int get hashCode {
    final l$countries = countries;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$countries.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is QueryListOfCountries) || runtimeType != other.runtimeType)
      return false;
    final l$countries = countries;
    final lOther$countries = other.countries;
    if (l$countries.length != lOther$countries.length) return false;
    for (int i = 0; i < l$countries.length; i++) {
      final l$countries$entry = l$countries[i];
      final lOther$countries$entry = lOther$countries[i];
      if (l$countries$entry != lOther$countries$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtensionQueryListOfCountries on QueryListOfCountries {
  QueryListOfCountries copyWith(
          {List<QueryListOfCountries$countries>? countries,
          String? $__typename}) =>
      QueryListOfCountries(
          countries: countries == null ? this.countries : countries,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const QUERY_LIST_OF_COUNTRIES = const DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListOfCountries'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'countries'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'code'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'phone'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'capital'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);

@JsonSerializable(explicitToJson: true)
class QueryListOfCountries$countries {
  QueryListOfCountries$countries(
      {required this.code,
      required this.name,
      required this.phone,
      this.capital,
      required this.$__typename});

  @override
  factory QueryListOfCountries$countries.fromJson(Map<String, dynamic> json) =>
      _$QueryListOfCountries$countriesFromJson(json);

  final String code;

  final String name;

  final String phone;

  final String? capital;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$QueryListOfCountries$countriesToJson(this);
  int get hashCode {
    final l$code = code;
    final l$name = name;
    final l$phone = phone;
    final l$capital = capital;
    final l$$__typename = $__typename;
    return Object.hashAll([l$code, l$name, l$phone, l$capital, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is QueryListOfCountries$countries) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) return false;
    final l$capital = capital;
    final lOther$capital = other.capital;
    if (l$capital != lOther$capital) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtensionQueryListOfCountries$countries
    on QueryListOfCountries$countries {
  QueryListOfCountries$countries copyWith(
          {String? code,
          String? name,
          String? phone,
          String? Function()? capital,
          String? $__typename}) =>
      QueryListOfCountries$countries(
          code: code == null ? this.code : code,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          capital: capital == null ? this.capital : capital(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
