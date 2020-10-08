import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/domain/auth/firebase_auth_result.dart';
import 'package:flutter_app/domain/auth/i_auth_facade.dart';
import 'package:injectable/injectable.dart';

import 'auth_failure_or_success.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade extends IAuthFacade {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthFacade(this._firebaseAuth);

  @override
  Future<FirebaseAuthResult> registerWithEmailAndPassword(
      {String emailAddress, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      return FirebaseAuthResult(
        isSuccess: true,
        authFailureOrSuccess: AuthFailureOrSuccess.success(),
      );
    } catch (e) {
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        return FirebaseAuthResult(
          isSuccess: false,
          authFailureOrSuccess: AuthFailureOrSuccess.emailAlreadyInUse(),
        );
      } else {
        return FirebaseAuthResult(
          isSuccess: false,
          authFailureOrSuccess: AuthFailureOrSuccess.serverError(),
        );
      }
    }
  }

  @override
  Future<FirebaseAuthResult> signInWithEmailAndPassword(
      {String emailAddress, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);

      return FirebaseAuthResult(
        isSuccess: true,
        authFailureOrSuccess: AuthFailureOrSuccess.success(),
      );
    } catch (e) {
      if (e.code == "ERROR_INVALID_EMAIL" || e.code == "ERROR_WRONG_PASSWORD") {
        return FirebaseAuthResult(
          isSuccess: false,
          authFailureOrSuccess: AuthFailureOrSuccess.invalidEmailAndPassword(),
        );
      } else {
        return FirebaseAuthResult(
          isSuccess: false,
          authFailureOrSuccess: AuthFailureOrSuccess.serverError(),
        );
      }
    }
  }
}
