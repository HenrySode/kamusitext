// To parse this JSON data, do
//     final translationModel = translationModelFromJson(jsonString);

import 'dart:convert';

TranslationModel translationModelFromJson(String str) =>
    TranslationModel.fromJson(json.decode(str));

String translationModelToJson(TranslationModel data) =>
    json.encode(data.toJson());

class TranslationModel {
  String name;
  String description;
  List<String> renders;
  List<String> parses;

  TranslationModel({
    required this.name,
    required this.description,
    required this.renders,
    required this.parses,
  });

  factory TranslationModel.fromJson(Map<String, dynamic> json) =>
      TranslationModel(
        name: json["name"],
        description: json["description"],
        renders: List<String>.from(json["renders"].map((x) => x)),
        parses: List<String>.from(json["parses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "renders": List<dynamic>.from(renders.map((x) => x)),
        "parses": List<dynamic>.from(parses.map((x) => x)),
      };
}
