library standalone_pkg;

import '../../data/repository/send_email_verification_repository.dart';


class SendEmailVerificationUseCase {
  final SendEmailVerificationRepository repository;

  SendEmailVerificationUseCase(this.repository);

  Future<void> sendEmailVerificationLink() async {
    try {
      return await repository.sendEmailVerificationLine();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
