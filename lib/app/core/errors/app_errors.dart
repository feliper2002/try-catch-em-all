abstract class AppFailure {
  final String message;

  AppFailure(this.message);
}

/// This class 'll be thrown when a [HTTP Request] fails
///
/// Using packages as `dio`, `http` or `uno`, this same [AppFailure] class 'll be thrown
/// on try/catch statement if request fails.
class DataRequestError extends AppFailure {
  DataRequestError(String message) : super(message);
}

/// This class 'll be thrown when the connection with some [Database] class fails
class DatabaseConnectionError extends AppFailure {
  DatabaseConnectionError(String message) : super(message);
}

/// This class 'll be thrown when the connection with [HasuraConnection] class fails
class DatabaseHasuraConnectionError extends AppFailure {
  DatabaseHasuraConnectionError(String message) : super(message);
}

/// This class 'll be thrown when `data` from some [Database] class load fails
///
/// That probably 'll means the data doesn't came right from [Database] or some given
/// instructions at Database class are wrong
class LoadDataError extends AppFailure {
  LoadDataError(String message) : super(message);
}

class UsecaseDataError extends LoadDataError {
  UsecaseDataError(String message) : super(message);
}
