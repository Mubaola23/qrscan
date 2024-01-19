import 'package:flutter/material.dart';

enum AppState {
  idle,
  loading,
  error,
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_DELETED,
  DATA_NOT_ADDED,
  DATA_NOT_DELETED,
  STEPS_READY,
}

extension AppStateExtension on AppState {
  bool get isLoading => this == AppState.loading;
  bool get isIdle => this == AppState.idle;
  bool get isError => this == AppState.error;
  bool get isFetching => this == AppState.FETCHING_DATA;
  bool get isSteps => this == AppState.STEPS_READY;
  bool get isDataReady => this == AppState.DATA_READY;
  bool get isNoData => this == AppState.NO_DATA;
}

class BaseChangeNotifier extends ChangeNotifier {
  AppState _state = AppState.idle;

  AppState get state => _state;

  void setState({AppState? state}) {
    if (state != null) {
      _state = state;
    }

    notifyListeners();
  }
}
