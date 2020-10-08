import 'package:flutter/material.dart';

import 'firebase_auth_result.dart';

abstract class IAuthFacade {
  Future<FirebaseAuthResult> registerWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });

  Future<FirebaseAuthResult> signInWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });
}
