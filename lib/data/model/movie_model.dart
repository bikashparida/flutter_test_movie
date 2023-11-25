import 'dart:convert';

class MovieModel {
  final double? score;
  final Show? show;

  MovieModel({
    this.score,
    this.show,
  });

  factory MovieModel.fromRawJson(String str) =>
      MovieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        score: json["score"]?.toDouble(),
        show: json["show"] == null ? null : Show.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show?.toJson(),
      };
}

class Show {
  final int? id;
  final String? url;
  final String? name;
  final String? language;
  final DateTime? premiered;
  final String? officialSite;
  final Rating? rating;
  final ImageModel? image;
  final String? summary;

  Show({
    this.id,
    this.url,
    this.name,
    this.language,
    this.premiered,
    this.officialSite,
    this.rating,
    this.image,
    this.summary,
  });

  factory Show.fromRawJson(String str) => Show.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        language: json["language"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        officialSite: json["officialSite"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        summary: json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "language": language,
        "premiered":
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "rating": rating?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
      };
}

class ImageModel {
  final String? medium;
  final String? original;

  ImageModel({
    this.medium,
    this.original,
  });

  factory ImageModel.fromRawJson(String str) =>
      ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
      };
}

class Rating {
  final double? average;

  Rating({
    this.average,
  });

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}
