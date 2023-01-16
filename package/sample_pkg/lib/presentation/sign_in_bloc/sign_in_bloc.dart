library standalone_pkg;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/send_email_verification_usecase.dart';
import '../../domain/usecase/sign_in_usecase.dart';
import '../../domain/usecase/user_usecase.dart';
import '../../util/result.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;
  final UserUseCase userUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;

  SignInBloc(
      this.signInUseCase, this.userUseCase, this.sendEmailVerificationUseCase)
      : super(SignInInitial()) {
    on<SignIn>((event, emit) => _onSignIn(event, emit));
    on<SendEmailVerification>(
        (event, emit) => _onSendEmailVerification(event, emit));
  }

  _onSignIn(SignIn event, Emitter<SignInState> emitter) async {
    emitter(SignInLoading());
    try {
      await signInUseCase.signIn(event.email, event.password);

      final isVerified = await signInUseCase.isEmailVerified();
      if ((isVerified as Success).data as bool) {
        final user = await userUseCase.getUser();
        ((user as Success)).data != null
            ? emitter(AuthenticatedUser(user))
            : emitter(UserInfoNotExisted());
      } else {
        emitter(EmailNotVerified());
      }
    } catch (e) {
      emitter(ExceptionOccurred(e.toString()));
    }
  }

  _onSendEmailVerification(
      SendEmailVerification event, Emitter<SignInState> emitter) async {
    emitter(SignInLoading());
    try {
      await sendEmailVerificationUseCase.sendEmailVerificationLink();
      emitter(EmailVerificationSent());
    } catch (e) {
      emitter(ExceptionOccurred(e.toString()));
    }
  }
}
