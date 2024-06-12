import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusService {
  String? _lookUpAddress;
  bool? _hasConnection;

  final StreamController<bool> _connectionChangeController = StreamController.broadcast();
  final Connectivity _connectivity = Connectivity();

  ConnectionStatusService(String? lookUpAddress) {
    assert(lookUpAddress != null && lookUpAddress != '');
    _lookUpAddress = lookUpAddress;
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream<bool> get connectionChange => _connectionChangeController.stream;

  bool? get hasConnection => _hasConnection;

  void dispose() {
    _connectionChangeController.close();
  }

  void _connectionChange(List<ConnectivityResult> results) {
    checkConnection(results.first);
  }

  Future<bool> checkConnection([ConnectivityResult? result]) async {
    bool? previousConnection = _hasConnection;

    if (result != null && result == ConnectivityResult.none) {
      _hasConnection = false;
    } else {
      await Future.delayed(const Duration(milliseconds: 1000), () async {
        try {
          final result = await InternetAddress.lookup(_lookUpAddress!);
          _hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        } on SocketException catch (_) {
          _hasConnection = false;
        }
      });
    }

    if (previousConnection != _hasConnection) {
      _connectionChangeController.add(_hasConnection ?? false);
    }

    return _hasConnection ?? false;
  }
}
