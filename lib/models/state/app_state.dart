import 'package:freezed_annotation/freezed_annotation.dart';

import '../app_tabs.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppTabs.main) AppTabs currentTab,
    @Default(true) bool isConnection,
  }) = _AppState;
}
