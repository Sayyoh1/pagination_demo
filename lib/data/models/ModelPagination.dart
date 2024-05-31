/// info : {"count":826,"pages":42,"next":"https://rickandmortyapi.com/api/character/?page=20","prev":"https://rickandmortyapi.com/api/character/?page=18"}
/// results : [{"id":361,"name":"Toxic Rick","status":"Dead","species":"Humanoid","type":"Rick's Toxic Side","gender":"Male","origin":{"name":"Alien Spa","url":"https://rickandmortyapi.com/api/location/64"},"location":{"name":"Earth","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/361.jpeg","episode":["https://rickandmortyapi.com/api/episode/27"],"url":"https://rickandmortyapi.com/api/character/361","created":"2018-01-10T18:20:41.703Z"},null]

class ModelPagination {
  ModelPagination({
    Info? info,
    List<Results>? results,
  }) {
    _info = info;
    _results = results;
  }

  ModelPagination.fromJson(dynamic json) {
    _info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results!.add(Results.fromJson(v));
      });
    }
  }

  Info? _info;
  List<Results>? _results;

  ModelPagination copyWith({
    required Info? info,
    required List<Results>? results,
  }) =>
      ModelPagination(
        info: info ?? _info,
        results: results ?? _results,
      );

  Info? get info => _info;

  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_info != null) {
      map['info'] = _info!.toJson();
    }
    if (_results != null) {
      map['results'] = _results!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 361
/// name : "Toxic Rick"
/// status : "Dead"
/// species : "Humanoid"
/// type : "Rick's Toxic Side"
/// gender : "Male"
/// origin : {"name":"Alien Spa","url":"https://rickandmortyapi.com/api/location/64"}
/// location : {"name":"Earth","url":"https://rickandmortyapi.com/api/location/20"}
/// image : "https://rickandmortyapi.com/api/character/avatar/361.jpeg"
/// episode : ["https://rickandmortyapi.com/api/episode/27"]
/// url : "https://rickandmortyapi.com/api/character/361"
/// created : "2018-01-10T18:20:41.703Z"

class Results {
  Results({
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

  Results.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }

  num? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results copyWith(
    num? id_,
    String? name_,
    String? status_,
    String? species_,
    String? type_,
    String? gender_,
    Origin? origin_,
    Location? location_,
    String? image_,
    List<String>? episode_,
    String? url_,
    String? created_,
  ) =>
      Results(
        id: id_ = id,
        name: name_ = name,
        status: status_ = status,
        species: species_ = species,
        type: type_ = type,
        gender: gender_ = gender,
        origin: origin_ = origin,
        location: location_ = location,
        image: image_ = image,
        episode: episode_ = episode,
        url: url_ = url,
        created: created_ = created,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['species'] = species;
    map['type'] = type;
    map['gender'] = gender;
    if (origin != null) {
      map['origin'] = origin!.toJson();
    }
    if (location != null) {
      map['location'] = location!.toJson();
    }
    map['image'] = image;
    map['episode'] = episode;
    map['url'] = url;
    map['created'] = created;
    return map;
  }
}

/// name : "Earth"
/// url : "https://rickandmortyapi.com/api/location/20"

class Location {
  Location({
    String? name,
    String? url,
  }) {
    _name = name;
    _url = url;
  }

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String? _name;
  String? _url;

  Location copyWith(
    String? name,
    String? url,
  ) =>
      Location(
        name: name = _name,
        url: url = _url,
      );

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}

/// name : "Alien Spa"
/// url : "https://rickandmortyapi.com/api/location/64"

class Origin {
  Origin({
    String? name,
    String? url,
  }) {
    _name = name;
    _url = url;
  }

  Origin.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }

  String? _name;
  String? _url;

  Origin copyWith(
    String? name,
    String? url,
  ) =>
      Origin(
        name: name = _name,
        url: url = _url,
      );

  String? get name => _name;

  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}

/// count : 826
/// pages : 42
/// next : "https://rickandmortyapi.com/api/character/?page=20"
/// prev : "https://rickandmortyapi.com/api/character/?page=18"

class Info {
  Info({
    num? count,
    num? pages,
    String? next,
    String? prev,
  }) {
    _count = count;
    _pages = pages;
    _next = next;
    _prev = prev;
  }

  Info.fromJson(dynamic json) {
    _count = json['count'];
    _pages = json['pages'];
    _next = json['next'];
    _prev = json['prev'];
  }

  num? _count;
  num? _pages;
  String? _next;
  String? _prev;

  Info copyWith(
    num? count,
    num? pages,
    String? next,
    String? prev,
  ) =>
      Info(
        count: count = _count,
        pages: pages = _pages,
        next: next = _next,
        prev: prev = _prev,
      );

  num? get count => _count;

  num? get pages => _pages;

  String? get next => _next;

  String? get prev => _prev;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['pages'] = _pages;
    map['next'] = _next;
    map['prev'] = _prev;
    return map;
  }
}
