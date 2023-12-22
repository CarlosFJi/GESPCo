import 'package:flutter/material.dart';
import 'package:gespco/src/pages/barcode_scanner/barcode_controller.dart';
import 'package:gespco/src/pages/barcode_scanner/get_barcode_scanner.dart';
import 'package:gespco/src/shared/themes/font_style.dart';
import 'package:gespco/src/shared/themes/theme_colors.dart';
import 'package:gespco/src/shared/widgets/buttons/set_labels_btn/set_labels_btn.dart';
import 'package:gespco/src/shared/widgets/camera/camera_bottom_sheet.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  final controller = BarcodeController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/crear_eventos",
            arguments: controller.status.barcode);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<GetBarcodeScanner>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    color: Colors.blue,
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    "Escanée el código de barras",
                    style: FontStyles.buttonBackground,
                  ),
                  leading: const BackButton(
                    color: ThemeColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                bottomNavigationBar: SetLabelsBtn(
                  labelPrimary: "Insertar código de ticket",
                  onTapPrimary: () {
                    controller.status = GetBarcodeScanner.error("Error");
                  },
                  labelSecondary: "Añadir desde la galeríá",
                  onTapSecondary: controller.scanWithImagePicker,
                )),
          ),
          ValueListenableBuilder<GetBarcodeScanner>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: CameraBottomSheet(
                          labelPrimary: "Escanear de nuevo",
                          onTapPrimary: () {
                            controller.scanWithCamera();
                          },
                          labelSecondary: "Digitar código",
                          onTapSecondary: () {},
                          title: "No ha sido posible identificar el código",
                          subtitle: "Escanea o escribe de nuevo el código."));
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
