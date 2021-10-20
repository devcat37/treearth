class _BaseLoadResult<T> {
  const _BaseLoadResult({
    this.exception,
    this.noConnect = false,
  });

  final dynamic exception;

  /// Вызванно ли исключение отключением сети.
  /// true - значит исключение вызванно отключением от сети.
  /// false (по умолчанию) - значит исключение вызванно чем либо другим.
  final bool noConnect;

  //TODO: дополнить преобразование в строку
  String get errorMessage {
    if (exception is String) {
      return exception as String;
    } else if (exception is Error) {
      return (exception as Error).toString();
    } else if (exception is Exception) {
      return (exception as Exception).toString();
    } else {
      return exception.toString();
    }
  }

  bool get isFailure => exception != null;

  bool get isSuccessful => !isFailure;
}

class LoadResult<T> extends _BaseLoadResult {
  const LoadResult({
    this.data,
    dynamic exception,
    bool noConnect = false,
  }) : super(
          exception: exception,
          noConnect: noConnect,
        );

  final T? data;
}

class ListLoadResult<T> extends _BaseLoadResult {
  const ListLoadResult({
    this.data,
    dynamic exception,
    bool noConnect = false,
    this.totalCount = 0,
    this.page = 0,
    this.limit = 0,
  }) : super(
          exception: exception,
          noConnect: noConnect,
        );

  final List<T>? data;

  final int totalCount;

  final int page;

  final int limit;

  bool get canLoadMore => (data?.length ?? 0) < totalCount;
}
