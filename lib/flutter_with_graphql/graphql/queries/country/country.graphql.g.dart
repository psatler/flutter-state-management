// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variables$Query$SingleCountry _$Variables$Query$SingleCountryFromJson(
        Map<String, dynamic> json) =>
    Variables$Query$SingleCountry(
      countryId: json['countryId'] as String,
    );

Map<String, dynamic> _$Variables$Query$SingleCountryToJson(
        Variables$Query$SingleCountry instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
    };

Query$SingleCountry _$Query$SingleCountryFromJson(Map<String, dynamic> json) =>
    Query$SingleCountry(
      country: json['country'] == null
          ? null
          : Query$SingleCountry$country.fromJson(
              json['country'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$SingleCountryToJson(
        Query$SingleCountry instance) =>
    <String, dynamic>{
      'country': instance.country?.toJson(),
      '__typename': instance.$__typename,
    };

Query$SingleCountry$country _$Query$SingleCountry$countryFromJson(
        Map<String, dynamic> json) =>
    Query$SingleCountry$country(
      code: json['code'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      capital: json['capital'] as String?,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$SingleCountry$countryToJson(
        Query$SingleCountry$country instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'phone': instance.phone,
      'capital': instance.capital,
      '__typename': instance.$__typename,
    };
