import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/app_tabs.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppTabs.main) AppTabs currentTab,
    @Default(true) bool isConnection,
    @Default(false) bool isAuthorized,
  }) = _AppState;
}
