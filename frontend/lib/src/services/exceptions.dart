class ApiException implements Exception {
  final int? statusCode;
  final String? message;

  const ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException{statusCode: $statusCode, message: $message}';
  }
}

class ServiceException implements Exception {
  final String? message;

  const ServiceException(this.message);

  @override
  String toString() {
    return 'ServiceException{message: $message}';
  }
}

class AccessDeniedException extends ApiException {
  const AccessDeniedException(int? statusCode, String? message)
      : super(statusCode, message ?? 'error.msg.access_denied');

  @override
  String toString() {
    return 'AccessDeniedException{statusCode: $statusCode, message: $message}';
  }
}

class ServiceUnavailableException extends ServiceException {
  const ServiceUnavailableException() : super('error.msg.service_unavailable');

  @override
  String toString() {
    return 'ServiceUnavailableException{message: $message}';
  }
}

class NetworkConnectionLostException extends ServiceException {
  const NetworkConnectionLostException() : super('error.msg.network_connection_lost');

  @override
  String toString() {
    return 'NetworkConnectionLostException{message: $message}';
  }
}

