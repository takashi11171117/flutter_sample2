import 'dart:io';

import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

part 'app_page_notifier.freezed.dart';

final appPageNotifierProvider =
    StateNotifierProvider<AppPageNotifier>((ref) => AppPageNotifier(ref.read));

@freezed
class AppPageState with _$AppPageState {
  const factory AppPageState({
    @Default(0) int counter,
    @Default('') String privateIp,
  }) = _AppPageState;
}

class AppPageNotifier extends StateNotifier<AppPageState> {
  AppPageNotifier(this._read) : super(const AppPageState()) {
    _configure();
  }

  final Reader _read;
  final WifiInfo _wifiInfo = WifiInfo();

  Future<void> _configure() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      final status = await Permission.storage.status;
      print('aaaa');
    }
    String wifiIP;

    try {
      wifiIP = (await _wifiInfo.getWifiIP())!;
    } on PlatformException catch (e) {
      print(e.toString());
      wifiIP = "Failed to get Wifi IP";
    }

    printIps();

    print(wifiIP);

    // await HttpServer.bind(InternetAddress.anyIPv4, 8080).then((server) {
    //   server.listen((HttpRequest request) {
    //     request.response.write('Hello, world!');
    //     request.response.close();
    //   });
    // });

    var server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
    server.listen((request) {
      switch (request.method) {
        case 'GET':
          _handleGet(request);
          break;

        default:
          request.response.statusCode = HttpStatus.methodNotAllowed;
          request.response.close();
      }
    });
    // print("Server running on IP : " +
    //     server.address.toString() +
    //     " On Port : " +
    //     server.port.toString());
    // await for (var request in server) {
    //   request.response
    //     ..headers.contentType =
    //         new ContentType("text", "plain", charset: "utf-8")
    //     ..write('Hello, world')
    //     ..close();
    // }
  }

  Future<void> _handleGet(HttpRequest request) async {
    final tempDir = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);

    final file = File('$tempDir/sample.png');
    final found = await file.exists();
    if (found) {
      request.response.headers
          .set('content-type', ContentType.binary.toString());
      await file.openRead().pipe(request.response);
      request.response.contentLength = file.statSync().size;
      await request.response.addStream(file.openRead());
    } else {
      print('aaaa');
    }
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        if (interface.name == 'wlan0') {
          state = state.copyWith(privateIp: addr.address);
        }
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
      }
    }
  }
}
