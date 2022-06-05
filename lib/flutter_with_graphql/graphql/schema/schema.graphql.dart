import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$StringQueryOperatorInput {
  Input$StringQueryOperatorInput(
      {this.eq, this.ne, this.$in, this.nin, this.regex, this.glob});

  @override
  factory Input$StringQueryOperatorInput.fromJson(Map<String, dynamic> json) =>
      _$Input$StringQueryOperatorInputFromJson(json);

  final String? eq;

  final String? ne;

  @JsonKey(name: 'in')
  final List<String?>? $in;

  final List<String?>? nin;

  final String? regex;

  final String? glob;

  Map<String, dynamic> toJson() => _$Input$StringQueryOperatorInputToJson(this);
  int get hashCode {
    final l$eq = eq;
    final l$ne = ne;
    final l$$in = $in;
    final l$nin = nin;
    final l$regex = regex;
    final l$glob = glob;
    return Object.hashAll([
      l$eq,
      l$ne,
      l$$in == null ? null : Object.hashAll(l$$in.map((v) => v)),
      l$nin == null ? null : Object.hashAll(l$nin.map((v) => v)),
      l$regex,
      l$glob
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$StringQueryOperatorInput) ||
        runtimeType != other.runtimeType) return false;
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (l$eq != lOther$eq) return false;
    final l$ne = ne;
    final lOther$ne = other.ne;
    if (l$ne != lOther$ne) return false;
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) return false;
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) return false;
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }

    final l$nin = nin;
    final lOther$nin = other.nin;
    if (l$nin != null && lOther$nin != null) {
      if (l$nin.length != lOther$nin.length) return false;
      for (int i = 0; i < l$nin.length; i++) {
        final l$nin$entry = l$nin[i];
        final lOther$nin$entry = lOther$nin[i];
        if (l$nin$entry != lOther$nin$entry) return false;
      }
    } else if (l$nin != lOther$nin) {
      return false;
    }

    final l$regex = regex;
    final lOther$regex = other.regex;
    if (l$regex != lOther$regex) return false;
    final l$glob = glob;
    final lOther$glob = other.glob;
    if (l$glob != lOther$glob) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$CountryFilterInput {
  Input$CountryFilterInput({this.code, this.currency, this.continent});

  @override
  factory Input$CountryFilterInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CountryFilterInputFromJson(json);

  final Input$StringQueryOperatorInput? code;

  final Input$StringQueryOperatorInput? currency;

  final Input$StringQueryOperatorInput? continent;

  Map<String, dynamic> toJson() => _$Input$CountryFilterInputToJson(this);
  int get hashCode {
    final l$code = code;
    final l$currency = currency;
    final l$continent = continent;
    return Object.hashAll([l$code, l$currency, l$continent]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CountryFilterInput) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    final l$currency = currency;
    final lOther$currency = other.currency;
    if (l$currency != lOther$currency) return false;
    final l$continent = continent;
    final lOther$continent = other.continent;
    if (l$continent != lOther$continent) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$ContinentFilterInput {
  Input$ContinentFilterInput({this.code});

  @override
  factory Input$ContinentFilterInput.fromJson(Map<String, dynamic> json) =>
      _$Input$ContinentFilterInputFromJson(json);

  final Input$StringQueryOperatorInput? code;

  Map<String, dynamic> toJson() => _$Input$ContinentFilterInputToJson(this);
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$ContinentFilterInput) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Input$LanguageFilterInput {
  Input$LanguageFilterInput({this.code});

  @override
  factory Input$LanguageFilterInput.fromJson(Map<String, dynamic> json) =>
      _$Input$LanguageFilterInputFromJson(json);

  final Input$StringQueryOperatorInput? code;

  Map<String, dynamic> toJson() => _$Input$LanguageFilterInputToJson(this);
  int get hashCode {
    final l$code = code;
    return Object.hashAll([l$code]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$LanguageFilterInput) ||
        runtimeType != other.runtimeType) return false;
    final l$code = code;
    final lOther$code = other.code;
    if (l$code != lOther$code) return false;
    return true;
  }
}

const possibleTypesMap = {
  '_Entity': {'Country', 'Continent', 'Language'}
};
