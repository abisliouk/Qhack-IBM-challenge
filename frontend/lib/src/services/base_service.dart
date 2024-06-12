import 'package:flutter/material.dart';

import '../logger/logger.dart';
import 'services.dart';
import 'exceptions.dart';

export 'exceptions.dart';
export 'services.dart';

abstract class BaseService {
  late Logger _logger;

  BaseService() {
    _logger = getLogger(runtimeType.toString());
  }

  @protected
  Logger get logger => _logger;

  @protected
  Future<void> checkConnection() async {
    bool hasConnection = connectionStatusService.hasConnection ?? await connectionStatusService.checkConnection();
    if (!hasConnection) {
      throw const NetworkConnectionLostException();
    }
  }
}
