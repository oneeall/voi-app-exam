import 'data/app_error.dart';

class ResultResponseLoading<T> extends ResultResponseState<T> {
  ResultResponseLoading() : super._();
}

class ResultResponseFailure<T> extends ResultResponseState<T> {
  ResultResponseFailure({this.data, required this.error}) : super._();
  final T? data;
  final AppError? error;
}

class ResultResponseSuccess<T> extends ResultResponseState<T> {
  T? data;
  AppError? appError;

  bool get hasError => appError != null;

  ResultResponseSuccess({this.data, this.appError}) : super._();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResultResponseSuccess<T> &&
        other.data == data &&
        other.appError == appError;
  }

  @override
  int get hashCode => data.hashCode ^ appError.hashCode;
}

class ResultResponseState<T> {
  ResultResponseState._();

  factory ResultResponseState.success({
    required T? data,
  }) = ResultResponseSuccess;

  factory ResultResponseState.failure({T? data, required AppError error}) =
      ResultResponseFailure;

  factory ResultResponseState.loading() = ResultResponseLoading;
}
