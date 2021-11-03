import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sample2/models/example.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app_page_notifier.dart';

class AppPage extends HookWidget {
  const AppPage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = appPageNotifierProvider;
    final notifier = useProvider(provider);
    final counter = useProvider(appPageNotifierProvider.state
        .select((AppPageState state) => state.counter));
    final privateIp = useProvider(appPageNotifierProvider.state
        .select((AppPageState state) => state.privateIp));

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$privateIp:8080',
            ),
            SizedBox(
              height: 16,
            ),
            // Text(
            //   AppLocalizations.of(context)!.privacyPolicy,
            // ),
            // Text(
            //   counter.toString(),
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            // Assets.images.abundance.image(
            //   width: 150,
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: _uploadStepByStep,
              child: const Text('ftp'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: _saveHive,
              child: const Text('hive'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: _saveFile,
              child: const Text('file'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> _log(String log) async {
    print(log);
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  Future<File> _fileMock({
    String fileName = 'FlutterTest.txt',
    String content = '',
  }) async {
    final root = await getTemporaryDirectory();
    final file = File('${root.path}/$fileName');
    await file.writeAsString(content);
    return file;
  }

  Future<void> _uploadStepByStep() async {
    final _ftpConnect = FTPConnect(
      '192.168.11.10',
      user: 'ftptest',
      pass: '33874696Ezweb',
      debug: true,
      isSecured: false,
    );

    try {
      await _log('Connecting to FTP ...');
      await _ftpConnect.connect();
      // await _ftpConnect.changeDirectory('upload');
      final fileToUpload = await _fileMock(
          fileName: 'uploadStepByStep.txt', content: 'uploaded Step By Step');
      await _log('Uploading ...');
      await _ftpConnect.uploadFile(fileToUpload);
      await _log('file uploaded sucessfully');
      await _ftpConnect.disconnect();
    } on Exception catch (e) {
      await _log('Error: ${e.toString()}');
    }
  }

  Future<void> _saveHive() async {
    final example = Example()..name = 'test';
    final box = Hive.box<Example>('examples');
    await box.add(example);
  }

  Future<void> _saveFile() async {
    try {
      final tempDir = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);
      final fullPath = '$tempDir/sample.png';
      final response = await Dio().get<Uint8List>(
          'https://images.unsplash.com/photo-1604675223954-b1aabd668078?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
          options: Options(
            responseType: ResponseType.bytes,
          ));
      final file = File(fullPath);
      final raf = file.openSync(mode: FileMode.write)
        ..writeFromSync(response.data!);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }
}
