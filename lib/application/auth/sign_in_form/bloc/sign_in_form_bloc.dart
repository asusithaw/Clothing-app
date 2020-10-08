import 'package:flutter_app/domain/core/value_validators.dart';
import 'package:flutter_app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutter_app/domain/auth/i_auth_facade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event) async* {
    yield* event.map(
      emailChange: (event) async* {
        yield state.copyWith(
          emailAddress: event.email,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      passwordChange: (event) async* {
        yield state.copyWith(
          password: event.password,
          authFailureOrSuccess: AuthFailureOrSuccess.none(),
        );
      },
      signInWithEmailAndPassword: (event) async* {
        final String email = state.emailAddress;
        final String password = state.password;

        if (validateEmailAddress(email) && validatePassword(password)) {
          yield state.copyWith(
            showErrorMessages: false,
            isSubmitting: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );

          var result = await _authFacade.signInWithEmailAndPassword(
            emailAddress: email,
            password: password,
          );

          yield state.copyWith(
            isSubmitting: false,
            authFailureOrSuccess: result.authFailureOrSuccess,
          );
        } else {
          yield state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccess: AuthFailureOrSuccess.none(),
          );
        }
      },
    );
  }
}
