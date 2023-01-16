library standalone_pkg;

import '../datasource/send_email_verification/send_email_verification_datasource.dart';

abstract class SendEmailVerificationRepository {
  SendEmailVerificationRepository(this.dataSource);

  final SendEmailVerificationDataSource dataSource;

  Future<void> sendEmailVerificationLine();
}
