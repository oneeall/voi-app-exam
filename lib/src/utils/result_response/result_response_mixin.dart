import 'package:flutter/foundation.dart';

import 'data/app_error.dart';
import 'result_response_state.dart';

mixin ResultResponseMixin<T> on ChangeNotifier {
  ResultResponseState<T>? _responseState;

  ResultResponseState<T>? get responseState => _responseState;

  void showLoadingState() {
    _responseState = ResultResponseState.loading();
    notifyListeners();
  }

  void showResultState({T? data}) {
    _responseState = ResultResponseState.success(data: data);
    notifyListeners();
  }

  void showErrorState({required AppError error, T? data}) {
    _responseState = ResultResponseState.failure(error: error, data: data);
    notifyListeners();
  }
}
