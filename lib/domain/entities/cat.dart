class Cat {
  final List<Breed>? breeds;
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

 // Parsing from JSON
  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      breeds: (json['breeds'] as List<dynamic>?)
          ?.map((breed) => Breed.fromJson(breed as Map<String, dynamic>))
          .toList(),
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
    );
  }
}

class Breed {
  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final String? wikipediaURL;
  final String description;

  Breed(
      {required this.id,
      required this.name,
      required this.temperament,
      required this.origin,
      required this.lifeSpan,
      required this.wikipediaURL,
      required this.description});

  // Parsing from JSON
  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      temperament: json['temperament'] ?? '',
      origin: json['origin'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      wikipediaURL: json['wikipedia_url'],
      description: json['description'] ?? '',
    );
  }
}
