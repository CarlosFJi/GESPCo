import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/pages/barcode_scanner/barcode_controller.dart';
import 'package:gespco/src/pages/barcode_scanner/barcode_scanner.dart';
import 'package:gespco/src/pages/event_list/events.dart';
import 'package:gespco/src/pages/home/home_controller.dart';
import 'package:gespco/src/pages/splash/splash.dart';
import 'package:gespco/src/pages/tickets/tickets.dart';
import 'package:gespco/src/pages/wip_build/wip_build.page.dart';
import 'package:gespco/src/shared/classes/dataUser.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';

import '../crear_eventos/crear_eventos.dart';

class MyHomePage extends StatefulWidget {
  final UserModel? user;
  const MyHomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  final List<String> items = ["Cerrar sesión"];
  final controller = HomeController();
  String? selectedValue;
  final eventPage = const EventPage();
  final crearEventos = const CrearEventos();
  final barcodeScannerCtrl = BarcodeController();
  final ticketPage = const TicketsPage();
  var pages = [];

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    barcodeScannerCtrl.dispose();
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.user!.role.isNaN) {
      setState(() {
        switch (widget.user!.role) {
          case 0:
            pages = [const EventPage(), const CrearEventos(), const WIPage()];
            break;
          case 1:
            pages = [const EventPage(), const BarcodeScanner(), const WIPage()];
            break;
          case 2:
            pages = [const TicketsPage(), const EventPage(), const WIPage()];
            break;
        }
      });
    }
    if (widget.user == null) {
      print("IYOO: ${widget.user}");
      controller.checkUser(context, widget.user!);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: ThemeColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Bienvenido ",
                    style: FontStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: widget.user!.name,
                          style: FontStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text(
                "Aquí mostraremos los distintos tickets o eventos.",
                style: FontStyles.captionShape,
              ),
              trailing: Container(
                height: 50,
                width: 49,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user!.photoURL!),
                        scale: 1.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        controller.signOut(context);
                        if (kDebugMode) print("Seleccionado: $value");
                      });
                    },
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black26,
                      ),
                      offset: const Offset(-20, -5),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    controller.setPage(0);
                  });
                  didUpdateWidget(widget);
                },
                icon: Icon(
                  Icons.home,
                  color: controller.currentPage == 0
                      ? ThemeColors.primary
                      : ThemeColors.body,
                )),
            GestureDetector(
              onTap: () async {
                setState(() {
                  controller.setPage(1);
                });
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: ThemeColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.add_box_outlined,
                  color: ThemeColors.background,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    controller.setPage(2);
                  });
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? ThemeColors.primary
                      : ThemeColors.body,
                )),
          ],
        ),
      ),
    );
  }
}

class PagesAvailable {}
