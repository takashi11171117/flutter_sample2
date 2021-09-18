import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../gen/assets.gen.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.privacyPolicy,
            ),
            Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Assets.images.abundance.image(
              width: 150,
            ),
            ElevatedButton(
              child: const Text('Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: _uploadStepByStep,
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
}
