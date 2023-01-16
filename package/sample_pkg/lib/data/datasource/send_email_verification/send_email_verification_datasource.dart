library standalone_pkg;

abstract class SendEmailVerificationDataSource {
  Future<void> sendEmailVerificationLink();
}
