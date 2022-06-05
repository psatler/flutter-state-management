// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Query$ListOfCountries _$Query$ListOfCountriesFromJson(
        Map<String, dynamic> json) =>
    Query$ListOfCountries(
      countries: (json['countries'] as List<dynamic>)
          .map((e) => Query$ListOfCountries$countries.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$ListOfCountriesToJson(
        Query$ListOfCountries instance) =>
    <String, dynamic>{
      'countries': instance.countries.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$ListOfCountries$countries _$Query$ListOfCountries$countriesFromJson(
        Map<String, dynamic> json) =>
    Query$ListOfCountries$countries(
      code: json['code'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      capital: json['capital'] as String?,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$ListOfCountries$countriesToJson(
        Query$ListOfCountries$countries instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'capital': instance.capital,
      '__typename': instance.$__typename,
    };
