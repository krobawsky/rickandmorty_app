import 'dart:convert';

CharacterListEntityResponse characterEntityResponseFromJson(String str) =>
    CharacterListEntityResponse.fromJson(json.decode(str));

class CharacterListEntityResponse {
  InfoEntityResponse? info;
  List<CharacterEntityResponse>? results;

  CharacterListEntityResponse({
    this.info,
    this.results,
  });

  factory CharacterListEntityResponse.fromJson(Map<String, dynamic> json) =>
      CharacterListEntityResponse(
        info: json["info"] == null
            ? null
            : InfoEntityResponse.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<CharacterEntityResponse>.from(json["results"]!
                .map((x) => CharacterEntityResponse.fromJson(x))),
      );
}

class InfoEntityResponse {
  int? count;
  int? pages;
  String? next;
  dynamic prev;

  InfoEntityResponse({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory InfoEntityResponse.fromJson(Map<String, dynamic> json) =>
      InfoEntityResponse(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}

class CharacterEntityResponse {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  LocationEntityResponse? origin;
  LocationEntityResponse? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterEntityResponse({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterEntityResponse.fromJson(Map<String, dynamic> json) =>
      CharacterEntityResponse(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: json["origin"] == null
            ? null
            : LocationEntityResponse.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : LocationEntityResponse.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );
}

class LocationEntityResponse {
  String? name;
  String? url;

  LocationEntityResponse({
    this.name,
    this.url,
  });

  factory LocationEntityResponse.fromJson(Map<String, dynamic> json) =>
      LocationEntityResponse(
        name: json["name"],
        url: json["url"],
      );
}
