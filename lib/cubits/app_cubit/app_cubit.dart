import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../models/app_tabs.dart';
import '../../services/reachability_service.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.repo) : super(const AppState());

  final ReachabilityService repo;

  void updateTab(AppTabs newTab) {
    emit(state.copyWith(currentTab: newTab));
  }

  Future<void> listenToConnectivity() async {
    repo.onStatusChange.listen((result) {
      if (result == InternetStatus.connected) {
        emit(state.copyWith(isConnection: true));
      } else {
        emit(state.copyWith(isConnection: false));
      }
    });
  }
}
