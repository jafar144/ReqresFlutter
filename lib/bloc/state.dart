sealed class CommonState {}

class Loading extends CommonState {}

class Success<T> extends CommonState {
  final T data;
  Success({required this.data});
}

class Error extends CommonState {
  final String message;
  Error({required this.message});
}
