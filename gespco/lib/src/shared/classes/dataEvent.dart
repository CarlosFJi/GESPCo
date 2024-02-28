import 'dart:convert';

class DataEvent {
  String? id;
  String? description;
  String title;
  String? date;
  String? cost;
  String? location;

  List<DataEvent> listEvents = [];

  DataEvent(
      {this.id,
      this.description,
      required this.title,
      this.date,
      this.cost,
      this.location});

  factory DataEvent.fromJson(Map<String, dynamic> json) => DataEvent(
      title: json["title"],
      id: json["id"],
      description: json["description"],
      date: json["date"],
      cost: json["cost"],
      location: json["location"]);

  static Map<String, dynamic> toJson(DataEvent data) => {
        "id": data.id,
        "title": data.title,
        "description": data.description,
        "date": data.date,
        "cost": data.cost,
        "location": data.location,
      };
}

class Context {
  String? id;
  String? description;
  String title;
  String? date;
  String? address;
  String? location;
  String? cost;
  String? org;
  String? vcard;
  String? schema;

  Context({
    this.id,
    required this.title,
    this.description,
  });

  factory Context.fromMap(Map<String, String> json) => Context(
        id: jsonEncode(json["id"]),
        title: jsonEncode(json["title"]),
        description: jsonEncode(json["description"]),
      );

  Map<String, dynamic> toJson(List<Context> data) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;

    return data;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
