import 'package:rickandmorty_app/data/entities/response/response.dart';

class CharacterListModel {
  InfoModel? info;
  List<CharacterModel> results;

  CharacterListModel({this.info, this.results = const []});

  factory CharacterListModel.fromEntity(CharacterListEntityResponse entity) =>
      CharacterListModel(
        info: entity.info == null ? null : InfoModel.fromEntity(entity.info!),
        results: entity.results == null
            ? []
            : List<CharacterModel>.from(
                entity.results!.map((x) => CharacterModel.fromEntity(x))),
      );
}

class InfoModel {
  int count;
  int? pages;
  String? next;
  dynamic prev;

  InfoModel({
    this.count = 0,
    this.pages,
    this.next,
    this.prev,
  });

  factory InfoModel.fromEntity(InfoEntityResponse entity) => InfoModel(
        count: entity.count ?? 0,
        pages: entity.pages,
        next: entity.next,
        prev: entity.prev,
      );
}

class CharacterModel {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  LocationModel? origin;
  LocationModel? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterModel({
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

  factory CharacterModel.fromEntity(CharacterEntityResponse entity) =>
      CharacterModel(
        id: entity.id,
        name: entity.name,
        status: entity.status,
        species: entity.species,
        type: entity.type,
        gender: entity.gender,
        origin: entity.origin == null
            ? null
            : LocationModel.fromEntity(entity.origin!),
        location: entity.location == null
            ? null
            : LocationModel.fromEntity(entity.location!),
        image: entity.image,
        episode: entity.episode == null
            ? []
            : List<String>.from(entity.episode!.map((x) => x)),
        url: entity.url,
        created: entity.created,
      );
}

class LocationModel {
  String name;
  String url;

  LocationModel({
    this.name = "",
    this.url = "",
  });

  factory LocationModel.fromEntity(LocationEntityResponse entity) =>
      LocationModel(
        name: entity.name ?? "",
        url: entity.url ?? "",
      );
}
