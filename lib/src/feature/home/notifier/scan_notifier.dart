import 'dart:developer';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utilities/base_change_notifier.dart';
import '../../../services/navigation_service.dart';
import '../model/scan_model.dart';

class ScanScreenNotifier extends BaseChangeNotifier {
  ScanScreenNotifier(this._read) {}

  Ref _read;
  ScanResult scanResult = ScanResult();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // void myFunction() async {
  //   const storage = FlutterSecureStorage();
  //   List<String> listViewerBuilderString = ['a1', 'a2', 'a3'];
  //   await storage.write(
  //       key: 'listOfItems', value: jsonEncode(listViewerBuilderString));
  //   String? stringOfItems = await storage.read(key: 'listOfItems');
  //   List<dynamic> listOfItems = jsonDecode(stringOfItems!);
  //   print(listOfItems);
  // }
  List<ScanModel> scans = [];
  addScan(ScanModel scan) async {
    scans.add(scan);
    setState();
  }

  int createdQr = 0;
  changeSreatedQr() {
    createdQr++;
    setState();
  }
  // fetchScans() async {
  //   // String str = "[137, 80, 78, 71, 13, 10, 26, 10]";
  //   var read = await _storage.read(key: "scans");
  //   print(read);
  //   // List<ScanModel> res = await jsonDecode(read!) as List<ScanModel>;
  //   // scans = res;
  //   print("sccccccccccccc");
  //   // log(scans.first.content);
  //
  //   setState();
  // }

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  void navigateToScanToPay() async {
    _read.read(navigationService).navigateBack();
  }

  Future<void> scan() async {
    try {
      log("Starting 11");

      ScanResult result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          // android: AndroidOptions(
          //   aspectTolerance: _aspectTolerance,
          //   useAutoFocus: _useAutoFocus,
          // ),
        ),
      );
      log("Starting22");

      scanResult = result;
      log(" format note: ${result.formatNote}");
      log(" raw content: ${result.rawContent}");
      log("format : ${result.format}");
      log("type: ${result.type}");
      if (scanResult.rawContent.isNotEmpty) {
        addScan(ScanModel(
            name: result.type.name,
            type: DateTime.now().toString(),
            content: result.rawContent));
      }
    } on PlatformException catch (e) {
      scanResult = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
        rawContent: e.code == BarcodeScanner.cameraAccessDenied
            ? 'The user did not grant the camera permission!'
            : 'Unknown error: $e',
      );
    }
  }
}

final scanScreenNotifier = ChangeNotifierProvider(
  (ref) => ScanScreenNotifier(ref),
);
