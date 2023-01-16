library standalone_pkg;

import '../../data/datasource/send_email_verification/firebase_send_email_verification_datasource.dart';
import '../../data/repository/send_email_verification_repository.dart';

class FirebaseSendEmailVerificationRepositoryImpl
    extends SendEmailVerificationRepository {
  FirebaseSendEmailVerificationRepositoryImpl()
      : super(FirebaseSendEmailVerificationDataSource());

  @override
  Future<void> sendEmailVerificationLine() async {
    return await dataSource.sendEmailVerificationLink();
  }
}
