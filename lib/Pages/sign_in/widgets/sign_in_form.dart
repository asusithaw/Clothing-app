import 'package:flutter_app/Home.dart';
import 'package:flutter_app/infrastructure/auth/auth_failure_or_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/sign_up/sign_up_page.dart';
import 'package:flutter_app/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_app/domain/core/value_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        if (state.authFailureOrSuccess == AuthFailureOrSuccess.success()) {
          //showSnackBar(context, SnackBar(
            //backgroundColor: Colors.blue,
           // content: Text('Success'),
          //));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return Homepage();
              }));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.emailAlreadyInUse()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('Email Already In Use'),
          ));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.invalidEmailAndPassword()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('Invalid Email And Password'),
          ));
        } else if (state.authFailureOrSuccess == AuthFailureOrSuccess.serverError()) {
          showSnackBar(context, SnackBar(
            backgroundColor: Colors.red,
            content: Text('Server Error'),
          ));
        }
       },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
            bottom: 50,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Form(
            autovalidate: state.showErrorMessages,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email address',
                      ),
                      autocorrect: false,
                      autofocus: false,
                      onChanged: (value) => context
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.emailChange(value)),
                      validator: (_) => validateEmailAddress(
                              context.bloc<SignInFormBloc>().state.emailAddress)
                          ? null
                          : "Invalid Email",
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                      autocorrect: false,
                      autofocus: false,
                      obscureText: true,
                      onChanged: (value) => context
                          .bloc<SignInFormBloc>()
                          .add(SignInFormEvent.passwordChange(value)),
                      validator: (_) => validatePassword(
                              context.bloc<SignInFormBloc>().state.password)
                          ? null
                          : 'Short Password',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Forget your password?',
                          style: TextStyle(
                            color: Color(0xff347af0),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        context
                            .bloc<SignInFormBloc>()
                            .add(SignInFormEvent.signInWithEmailAndPassword());
                      },
                      color: Color(0xff347af0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        side: BorderSide(
                          color: Color(0xff347af0),
                        ),
                      ),
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Color(0xff485068),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpPage();
                            }));

                          },
                          child: Text(
                            'Sign Up?',
                            style: TextStyle(
                              color: Color(0xff347af0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showSnackBar(BuildContext context, Widget snackBar) {
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
