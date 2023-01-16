library standalone_pkg;

import 'package:firebase_auth/firebase_auth.dart';

import '../../../util/result.dart';
import 'registration_datasource.dart';

class FirebaseRegistrationDataSource implements RegistrationDataSource {
  @override
  Future<Result> register(String email, String password) async {
    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Success(data: userCredential);
    } on FirebaseException catch (e) {
      return Failure(e.message.toString());
    } catch (e) {
      return Failure(e);
    }
  }
}
