// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input$StringQueryOperatorInput _$Input$StringQueryOperatorInputFromJson(
        Map<String, dynamic> json) =>
    Input$StringQueryOperatorInput(
      eq: json['eq'] as String?,
      ne: json['ne'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      nin: (json['nin'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      regex: json['regex'] as String?,
      glob: json['glob'] as String?,
    );

Map<String, dynamic> _$Input$StringQueryOperatorInputToJson(
        Input$StringQueryOperatorInput instance) =>
    <String, dynamic>{
      'eq': instance.eq,
      'ne': instance.ne,
      'in': instance.$in,
      'nin': instance.nin,
      'regex': instance.regex,
      'glob': instance.glob,
    };

Input$CountryFilterInput _$Input$CountryFilterInputFromJson(
        Map<String, dynamic> json) =>
    Input$CountryFilterInput(
      code: json['code'] == null
          ? null
          : Input$StringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Input$StringQueryOperatorInput.fromJson(
              json['currency'] as Map<String, dynamic>),
      continent: json['continent'] == null
          ? null
          : Input$StringQueryOperatorInput.fromJson(
              json['continent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Input$CountryFilterInputToJson(
        Input$CountryFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
      'currency': instance.currency?.toJson(),
      'continent': instance.continent?.toJson(),
    };

Input$ContinentFilterInput _$Input$ContinentFilterInputFromJson(
        Map<String, dynamic> json) =>
    Input$ContinentFilterInput(
      code: json['code'] == null
          ? null
          : Input$StringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Input$ContinentFilterInputToJson(
        Input$ContinentFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
    };

Input$LanguageFilterInput _$Input$LanguageFilterInputFromJson(
        Map<String, dynamic> json) =>
    Input$LanguageFilterInput(
      code: json['code'] == null
          ? null
          : Input$StringQueryOperatorInput.fromJson(
              json['code'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Input$LanguageFilterInputToJson(
        Input$LanguageFilterInput instance) =>
    <String, dynamic>{
      'code': instance.code?.toJson(),
    };
