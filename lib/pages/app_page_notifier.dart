import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  AppPageNotifier(this._read) : super(const AppPageState());

  final Reader _read;

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }
}
