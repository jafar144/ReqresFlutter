sealed class DetailState {}

class Idle extends DetailState {}

class Loading extends DetailState {}

class Success<T> extends DetailState {
  final T data;
  Success({required this.data});
}

class Error extends DetailState {
  final String message;
  Error({required this.message});
}
