import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class DataEvent {
  Context context;
  // List<Graph> graph;

  DataEvent({
    required this.context,
    // required this.graph,
  });

  factory DataEvent.fromMap(Map<String, dynamic> json) => DataEvent(
        context: Context.fromMap(json["context"]),
      );

  toJson(String data) => {jsonDecode(data)};

  Map<String, dynamic> toMap() {
    return {
      "context": context.toMap(),
    };
  }

  Future<List<DataEvent>> obtenerDatos() async {
    // TODO: Cabesa, llamada a API
    /*
    final httpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      'nombreDeTuCloudFunction', // Reemplaza con el nombre real de tu Cloud Function
    );

    final HttpsCallableResult result = await callable();

    final List<dynamic> responseData = result.data;

    return responseData.map((json) => DataEvent.fromJson(json)).toList();

    db.collection("users") .get() .addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() { @Override public void onComplete(@NonNull Task<QuerySnapshot> task) { if (task.isSuccessful()) { for (DocumentSnapshot document : task.getResult()) { s(document.getId() + " => " + document.getData()); } } else { s("Error getting documents."+ task.getException()); } } });
      */
    return {} as List<DataEvent>;
  }
}

class Context {
  String id;
  String description;
  String title;
  String c;
  String dcterms;
  String geo;
  String loc;
  String org;
  String vcard;
  String schema;
  String relation;
  String references;
  String address;
  String area;
  String district;
  String locality;
  String postalCode;
  String streetAddress;
  String location;
  String latitude;
  String longitude;
  String organization;
  String organizationDesc;
  String accesibility;
  String services;
  String schedule;
  String organizationName;

  String link;
  String uid;
  String dtstart;
  String dtend;
  String time;
  String excludedDays;
  String eventLocation;
  String free;
  String price;
  String recurrence;
  String days;
  String frequency;
  String interval;
  String audience;

  Context({
    required this.id,
    required this.title,
    required this.description,
    required this.c,
    required this.dcterms,
    required this.geo,
    required this.loc,
    required this.org,
    required this.vcard,
    required this.schema,
    required this.relation,
    required this.references,
    required this.address,
    required this.area,
    required this.district,
    required this.locality,
    required this.postalCode,
    required this.streetAddress,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.organization,
    required this.organizationDesc,
    required this.accesibility,
    required this.services,
    required this.schedule,
    required this.organizationName,
    required this.link,
    required this.uid,
    required this.dtstart,
    required this.dtend,
    required this.time,
    required this.excludedDays,
    required this.eventLocation,
    required this.free,
    required this.price,
    required this.recurrence,
    required this.days,
    required this.frequency,
    required this.interval,
    required this.audience,
  });

  factory Context.fromMap(Map<String, dynamic> json) => Context(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      c: json["c"],
      dcterms: json["dcterms"],
      geo: json["geo"],
      loc: json["loc"],
      org: json["org"],
      vcard: json["vcard"],
      schema: json["schema"],
      relation: json["relation"],
      references: json["references"],
      address: json["address"],
      area: json["area"],
      district: json["district"],
      locality: json["locality"],
      postalCode: json["postalCode"],
      streetAddress: json["streetAddress"],
      location: json["location"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      organization: json["organization"],
      organizationDesc: json["organizationDesc"],
      accesibility: json["accesibility"],
      services: json["services"],
      schedule: json["schedule"],
      organizationName: json["organizationName"],
      link: json["link"],
      uid: json["uid"],
      dtstart: json["dtstart"],
      dtend: json["dtend"],
      time: json["time"],
      excludedDays: json["excludedDays"],
      eventLocation: json["eventLocation"],
      free: json["free"],
      price: json["price"],
      recurrence: json["recurrence"],
      days: json["days"],
      frequency: json["frequency"],
      interval: json["interval"],
      audience: json["audience"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;
    data["c"] = c;
    data["dcterms"] = dcterms;
    data["geo"] = geo;
    data["loc"] = loc;
    data["org"] = org;
    data["vcard"] = vcard;
    data["schema"] = schema;
    data["relation"] = relation;
    data["references"] = references;
    data["address"] = address;
    data["area"] = area;
    data["district"] = district;
    data["locality"] = locality;
    data["postalCode"] = postalCode;
    data["streetAddress"] = streetAddress;
    data["location"] = location;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["organization"] = organization;
    data["organizationDesc"] = organizationDesc;
    data["accesibility"] = accesibility;
    data["services"] = services;
    data["schedule"] = schedule;
    data["organizationName"] = organizationName;
    data["link"] = link;
    data["uid"] = uid;
    data["dtstart"] = dtstart;
    data["dtend"] = dtend;
    data["time"] = time;
    data["excludedDays"] = excludedDays;
    data["eventLocation"] = eventLocation;
    data["free"] = free;
    data["price"] = price;
    data["recurrence"] = recurrence;
    data["days"] = days;
    data["frequency"] = frequency;
    data["interval"] = interval;
    data["audience"] = audience;

    return data;
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "c": c,
        "dcterms": dcterms,
        "geo": geo,
        "loc": loc,
        "org": org,
        "vcard": vcard,
        "schema": schema,
        "relation": relation,
        "references": references,
        "address": address,
        "area": area,
        "district": district,
        "locality": locality,
        "postalCode": postalCode,
        "streetAddress": streetAddress,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "organization": organization,
        "organizationDesc": organizationDesc,
        "accesibility": accesibility,
        "services": services,
        "schedule": schedule,
        "organizationName": organizationName,
        "link": link,
        "uid": uid,
        "dtstart": dtstart,
        "dtend": dtend,
        "time": time,
        "excludedDays": excludedDays,
        "eventLocation": eventLocation,
        "free": free,
        "price": price,
        "recurrence": recurrence,
        "days": days,
        "frequency": frequency,
        "interval": interval,
        "audience": audience,
      };

  /*
  String numAsist;
  String c;
  String dcterms;
  String geo;
  String loc;
  String org;
  String vcard;
  String schema;
  String title;
  String id;
  String relation;
  String references;
  String address;
  String area;
  String district;
  String locality;
  String postalCode;
  String streetAddress;
  String location;
  String latitude;
  String longitude;
  String organization;
  String organizationDesc;
  String accesibility;
  String services;
  String schedule;
  String organizationName;
  String description;
  String link;
  String uid;
  String dtstart;
  String dtend;
  String time;
  String excludedDays;
  String eventLocation;
  String free;
  String price;
  String recurrence;
  String days;
  String frequency;
  String interval;
  String audience;

  Context({
    required this.id,
    required this.title,
    required this.description,

    required this.c,
    required this.dcterms,
    required this.geo,
    required this.loc,
    required this.org,
    required this.vcard,
    required this.schema,
    required this.title,

    required this.relation,
    required this.references,
    required this.address,
    required this.area,
    required this.district,
    required this.locality,
    required this.postalCode,
    required this.streetAddress,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.organization,
    required this.organizationDesc,
    required this.accesibility,
    required this.services,
    required this.schedule,
    required this.organizationName,

    required this.link,
    required this.uid,
    required this.dtstart,
    required this.dtend,
    required this.time,
    required this.excludedDays,
    required this.eventLocation,
    required this.free,
    required this.price,
    required this.recurrence,
    required this.days,
    required this.frequency,
    required this.interval,
    required this.audience,
  });
  */
}

class Graph {
  String title;
  String description;
  /*
  int free;
  String price;
  DateTime dtstart;
  DateTime dtend;
  String time;
  String excludedDays;
  Recurrence recurrence;
  String uid;
  String link;
  String eventLocation;
  References references;
  References relation;
  Address address;
  Location location;
  Organization organization;



  void main() async {
    // TODO: Llamada a BB.DD
    if (kDebugMode) {
      // Crear un nuevo contexto
      Context context = {"000", "testDes", "test"} as Context;
      // Crear un nuevo evento con el contexto creado
      DataEvent nuevoEvento = DataEvent(context: context);
      // Acceder a los atributos del evento y el contexto
      print("ID del contexto: ${nuevoEvento.context.id}");
      print("Descripción del contexto: ${nuevoEvento.context.description}");
      print("Title: ${nuevoEvento.context.title}");
    } else {
      List<DataEvent> listaEventos = await obtenerDatos();
      // Ahora puedes trabajar con la lista de eventos obtenida desde BigQuery
      for (DataEvent evento in listaEventos) {
        print('Nombre del title: ${evento.context.title}');
        print('Fecha del description: ${evento.context.description}');
        print('----------------------');
      }
    }

    // print("Latitud del contexto: ${nuevoEvento.context.latitud}");
    // print("Longitud del contexto: ${nuevoEvento.context.longitud}");
  }
*/
  Graph({
    required this.title,
    required this.description,
  });

  factory Graph.fromMap(Map<String, dynamic> map) {
    return Graph(title: map['title'], description: map['description']);
  }

  factory Graph.fromJson(String json) => Graph.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
      };

  String toJson() => jsonEncode(toMap());
}

class Address {
  References district;
  Area area;

  Address({
    required this.district,
    required this.area,
  });
}

class Area {
  String id;
  String locality;
  String postalCode;
  String streetAddress;

  Area({
    required this.id,
    required this.locality,
    required this.postalCode,
    required this.streetAddress,
  });
}

class References {
  String id;

  References({
    required this.id,
  });
}

// Un array de Location nos permite crear una carrera oficial
class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });
}

class Organization {
  String organizationName;
  String accesibility;

  Organization({
    required this.organizationName,
    required this.accesibility,
  });
}

class Recurrence {
  String days;
  String frequency;
  int interval;

  Recurrence({
    required this.days,
    required this.frequency,
    required this.interval,
  });
}
