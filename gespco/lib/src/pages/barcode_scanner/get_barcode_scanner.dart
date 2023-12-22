import 'package:camera/camera.dart';

class GetBarcodeScanner {
  final bool isAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  GetBarcodeScanner(
      {this.isAvailable = false,
      this.error = "",
      this.stopScanner = false,
      this.barcode = ""});

  factory GetBarcodeScanner.available() =>
      GetBarcodeScanner(isAvailable: true, stopScanner: false);

  factory GetBarcodeScanner.error(String message) =>
      GetBarcodeScanner(error: message, stopScanner: true);

  factory GetBarcodeScanner.barcode(String barcode) =>
      GetBarcodeScanner(barcode: barcode, stopScanner: true);

  bool get showCamera => isAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

  GetBarcodeScanner copyWith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return GetBarcodeScanner(
      isAvailable: isAvailable ?? this.isAvailable,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
