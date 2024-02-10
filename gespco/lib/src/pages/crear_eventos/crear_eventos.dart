// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/shared/auth/auth_controller.dart';
import 'package:gespco/src/shared/classes/dataEvent.dart';
import 'package:gespco/src/shared/environment/environment.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:gespco/src/shared/widgets/buttons/rounded_btn/rounded_button.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

class CrearEventos extends StatefulWidget {
  const CrearEventos({super.key});

  @override
  _crearEventoScreenState createState() => _crearEventoScreenState();
}

class _crearEventoScreenState extends State<CrearEventos> {
  //TODO: Checkear admin para crear el evento.
  final controller = AuthController();

  late String nombre;
  late DateTime fecha;
  late String description;
  late String ciudadOrigin;
  late List longLat;
/*
    EventoId INT PRIMARY KEY,
    NombreEvento VARCHAR(100) NOT NULL,
    FechaEvento DATE NOT NULL,
    Descripcion TEXT,
    Ciudad TEXT
    Long: DOUBLE
    Lat: DOUBLE
*/
  // TODO: Incluir datos de nuevo Evento
  DataEvent createNewEvent() {
    return {
      context: [],
    } as DataEvent;
  }

  Future<void> registerEvent(contextEvent) async {
    try {
      // final newUser = await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);
      // TODO: Service event + auth
      final newEvent = createNewEvent();
      Future.delayed(const Duration(seconds: 1));

      if (kDebugMode) {
        print("Nuevo Event: $newEvent");
        print("Imagen: ${Environment.imageDefault}");
      }
      final defaultImage = Environment.imageDefault;

      final eventCheck = DataEvent(context: contextEvent);
      print("Event: $eventCheck");
      // TODO: Register event on ddbb
      if (context.mounted) {
        // TODO: Call API
        if (kDebugMode) print("REGISTER $eventCheck");
        //
        // TODO: MODAL si es creado o no;
        // Navigator.pushReplacementNamed(context, '/home', arguments: userCheck);
      }
    } catch (e) {
      // TODO: Pantalla de error
      if (kDebugMode) {
        print("ERROR $e");
        // TODO: Modal control error;
        showSpinner = false;
      }
    }

    setState(() {
      showSpinner = false;
    });
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
              child: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacementNamed(context, '/home',
                  arguments: controller.user)),
        ),
        ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      nombre = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Introduce el título del evento:')),
                const SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      description = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Introduce una contraseña:')),
                RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Crear nuevo Evento',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
