import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class VariablesQuerySingleCountry {
  VariablesQuerySingleCountry({required this.countryId});

  @override
  factory VariablesQuerySingleCountry.fromJson(Map<String, dynamic> json) =>
      _$VariablesQuerySingleCountryFromJson(json);

  final String countryId;

  Map<String, dynamic> toJson() => _$VariablesQuerySingleCountryToJson(this);
  int get hashCode {
    final l$countryId = countryId;
    return Object.hashAll([l$countryId]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is VariablesQuerySingleCountry) ||
        runtimeType != other.runtimeType) return false;
    final l$countryId = countryId;
    final lOther$countryId = other.countryId;
    if (l$countryId != lOther$countryId) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class QuerySingleCountry {
  QuerySingleCountry({this.country, required this.$__typename});

  @override
  factory QuerySingleCountry.fromJson(Map<String, dynamic> json) =>
      _$QuerySingleCountryFromJson(json);

  final QuerySingleCountry$country? country;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$QuerySingleCountryToJson(this);
  int get hashCode {
    final l$country = country;
    final l$$__typename = $__typename;
    return Object.hashAll([l$country, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is QuerySingleCountry) || runtimeType != other.runtimeType)
      return false;
    final l$country = country;
    final lOther$country = other.country;
    if (l$country != lOther$country) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtensionQuerySingleCountry on QuerySingleCountry {
  QuerySingleCountry copyWith(
          {QuerySingleCountry$country? Function()? country,
          String? $__typename}) =>
      QuerySingleCountry(
          country: country == null ? this.country : country(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const QUERY_SINGLE_COUNTRY = const DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'SingleCountry'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'countryId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'country'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'code'),
                  value: VariableNode(name: NameNode(value: 'countryId')))
            ],
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
class QuerySingleCountry$country {
  QuerySingleCountry$country(
      {required this.code,
      required this.name,
      required this.phone,
      this.capital,
      required this.$__typename});

  @override
  factory QuerySingleCountry$country.fromJson(Map<String, dynamic> json) =>
      _$QuerySingleCountry$countryFromJson(json);

  final String code;

  final String name;

  final String phone;

  final String? capital;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$QuerySingleCountry$countryToJson(this);
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
    if (!(other is QuerySingleCountry$country) ||
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

extension UtilityExtensionQuerySingleCountry$country
    on QuerySingleCountry$country {
  QuerySingleCountry$country copyWith(
          {String? code,
          String? name,
          String? phone,
          String? Function()? capital,
          String? $__typename}) =>
      QuerySingleCountry$country(
          code: code == null ? this.code : code,
          name: name == null ? this.name : name,
          phone: phone == null ? this.phone : phone,
          capital: capital == null ? this.capital : capital(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
