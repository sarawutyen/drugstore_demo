import 'package:json_annotation/json_annotation.dart';

part 'auto_complete.g.dart';

@JsonSerializable()
class AutoComplete {
  AutoComplete({
    this.predictions,
    this.status,
  });

  factory AutoComplete.fromJson(Map<String, dynamic> json) =>
      _$AutoCompleteFromJson(json);

  @JsonKey(name: 'predictions')
  final List<Prediction>? predictions;

  @JsonKey(name: 'status')
  final String? status;

  Map<String, dynamic> toJson() => _$AutoCompleteToJson(this);
}

@JsonSerializable()
class Prediction {
  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
    this.distanceMeters
  });

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'distance_meters')
  final int? distanceMeters;

  @JsonKey(name: 'matched_substrings')
  final List<MatchedSubstring>? matchedSubstrings;

  @JsonKey(name: 'place_id')
  final String? placeId;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'structured_formatting')
  final StructuredFormatting? structuredFormatting;

  @JsonKey(name: 'terms')
  final List<Term>? terms;

  @JsonKey(name: 'types')
  final List<String>? types;

  Map<String, dynamic> toJson() => _$PredictionToJson(this);

  String get getMainText => structuredFormatting?.mainText ?? '';
  String get getSecondaryText => structuredFormatting?.secondaryText ?? '';
}

@JsonSerializable()
class MatchedSubstring {
  MatchedSubstring({
    this.length,
    this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) =>
      _$MatchedSubstringFromJson(json);

  @JsonKey(name: 'length')
  final int? length;
  @JsonKey(name: 'offset')
  final int? offset;

  Map<String, dynamic> toJson() => _$MatchedSubstringToJson(this);
}

@JsonSerializable()
class StructuredFormatting {
  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);

  @JsonKey(name: 'main_text')
  final String? mainText;

  @JsonKey(name: 'main_text_matched_substrings')
  final List<MatchedSubstring>? mainTextMatchedSubstrings;

  @JsonKey(name: 'secondary_text')
  final String? secondaryText;

  Map<String, dynamic> toJson() => _$StructuredFormattingToJson(this);
}

@JsonSerializable()
class Term {
  Term({
    this.offset,
    this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

  @JsonKey(name: 'offset')
  final int? offset;
  @JsonKey(name: 'value')
  final String? value;

  Map<String, dynamic> toJson() => _$TermToJson(this);
}
