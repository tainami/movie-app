class AppError {
  final String message;
  AppError(this.message);
}

class PlatformError extends AppError {
  PlatformError(super.message);

}

class UnknownError extends AppError {
  UnknownError(super.message);

}