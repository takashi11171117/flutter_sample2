import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

part 'app_page_notifier.freezed.dart';

final appPageNotifierProvider =
    StateNotifierProvider<AppPageNotifier>((ref) => AppPageNotifier(ref.read));

@freezed
class AppPageState with _$AppPageState {
  const factory AppPageState({
    @Default(0) int counter,
  }) = _AppPageState;
}

class AppPageNotifier extends StateNotifier<AppPageState> {
  AppPageNotifier(this._read) : super(const AppPageState()) {
    _configure();
  }

  final Reader _read;

  Future<void> _configure() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      final status = await Permission.storage.status;
      print('aaaa');
    }
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }
}
