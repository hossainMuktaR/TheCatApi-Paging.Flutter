class Cat {
  final List<Breed> breeds;
  final String id;
  final String url;
  final int width;
  final int height;

  Cat(
      {required this.breeds,
      required this.id,
      required this.url,
      required this.width,
      required this.height});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      breeds: (json['breed'] as List)
          .map((breed) => Breed.fromJson(breed as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}

class Breed {
  final String id;
  final String name;
  final String temperement;
  final String origin;
  final String lifeSpan;
  final String? wikipediaURL;
  final String description;

  Breed(
      {required this.id,
      required this.name,
      required this.temperement,
      required this.origin,
      required this.lifeSpan,
      required this.wikipediaURL,
      required this.description});

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
        id: json['id'] as String,
        name: json['name'] as String,
        temperement: json['temperement'] as String,
        origin: json['origin'] as String,
        lifeSpan: json['life_span'] as String,
        wikipediaURL: json['wifipedia_url'] as String,
        description: json['description'] as String);
  }
}
