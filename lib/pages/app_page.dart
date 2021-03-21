import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}
