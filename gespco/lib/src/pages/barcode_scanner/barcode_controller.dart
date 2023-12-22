import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gespco/src/pages/barcode_scanner/get_barcode_scanner.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class BarcodeController {
  final statusNotifier = ValueNotifier<GetBarcodeScanner>(GetBarcodeScanner());
  GetBarcodeScanner get status => statusNotifier.value;
  set status(GetBarcodeScanner status) => statusNotifier.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  CameraController? cameraController;
  InputImage? imagePicker;

  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.back);
      cameraController =
          CameraController(camera, ResolutionPreset.max, enableAudio: false);
      await cameraController!.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = GetBarcodeScanner.error(e.toString());
    }
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);

      var barcode;
      for (Barcode item in barcodes) {
        barcode = item.value;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = GetBarcodeScanner.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }

      return;
    } catch (e) {
      print("ERROR de lectura $e");
    }
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void scanWithCamera() {
    status = GetBarcodeScanner.available();
    Future.delayed(const Duration(seconds: 20)).then((value) {
      if (status.hasBarcode == false) {
        status = GetBarcodeScanner.error("Timeout de lectura");
      }
    });
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false) {
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final plane = cameraImage.planes.first;
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
                cameraImage.width.toDouble(), cameraImage.height.toDouble());
            const InputImageRotation imageRotation =
                InputImageRotation.rotation0deg;
            final InputImageFormat inputImageFormat =
                InputImageFormatValue.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.nv21;
            final planeData = InputImage.fromBytes(
                bytes: plane.bytes,
                metadata: InputImageMetadata(
                  size: Size(cameraImage.width.toDouble(),
                      cameraImage.height.toDouble()),
                  rotation:
                      InputImageRotation.rotation0deg, // used only in Android
                  format: InputImageFormat.nv21, // used only in iOS
                  bytesPerRow: plane.bytesPerRow, // used only in iOS
                ));

            if (kDebugMode) print("planeData: $planeData");
            final inputImageData = InputImageMetadata(
                size: imageSize,
                rotation: imageRotation,
                format: inputImageFormat,
                bytesPerRow: plane.bytesPerRow);
            final inputImageCamera =
                InputImage.fromBytes(bytes: bytes, metadata: inputImageData);
            scannerBarCode(inputImageCamera);
          } catch (e) {
            if (kDebugMode) print(e);
          }
        }
      });
    } else {
      if (kDebugMode) print("No es posible conectar con la cámara");
    }
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
