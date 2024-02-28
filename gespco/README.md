GESPco
----------
### Gestor de ESPéctaculos y Carrera oficial.

Applicación en Flutter, conecta con diversos servicios para gestionar la creación de eventos, tickets y los distintos perfiles de usuarios.
Se hace uso de los siguientes servicios:

- Google Cloud Platform:
  -  Pub/Service
  -  BigQuery

- Firebase:
  - Firebase Auth
  - Firestore Database

- Google API:
  - Google-Sign-In
  - Google-ML-Kit ( Barcode Scanner )
  
# Scaffolding
    /lib
        /assets
        /src
            /pages
                /barcode_scanner`´`
                /crear_eventos
                /extract
                /home
                /login
                /register
                /splash
                /tickets
            /services
                /db
                /signIn
            /shared
                /auth
                /classes
                /themes
                /widgets
                    /buttons
                    /ticket
    app.dart
    main.dart
    
# Instalación
    Se recomienda previamente configurar flutterfire
    `bash
flutterfire configure`

## Getting Started

`bash
flutter pub get
flutter run`

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
