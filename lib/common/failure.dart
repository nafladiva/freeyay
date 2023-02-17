abstract class Failure {
  final String message;

  const Failure({this.message = 'Something went wrong, try again later'});
}

class ServerFailure extends Failure {
  const ServerFailure({String? message}) : super(message: message ?? '');
}

class DataFailure extends Failure {
  const DataFailure({String? message}) : super(message: message ?? '');
}

class InternetConnectionFailure extends Failure {
  const InternetConnectionFailure({String? message})
      : super(message: message ?? '');
}
