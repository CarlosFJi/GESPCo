import 'dart:convert';

import 'package:flutter/foundation.dart';

class DataEvent {
  Context context;
  // List<Graph> graph;

  DataEvent({
    required this.context,
    // required this.graph,
  });

  Map<String, dynamic> toMap() {
    return {
      "context": context,
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
      */
    return {} as List<DataEvent>;
  }

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
}

class Context {
  String id;
  String description;
  String title;

  Context({
    required this.id,
    required this.title,
    required this.description,
  });
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
