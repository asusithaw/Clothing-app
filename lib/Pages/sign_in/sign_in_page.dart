import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_app/application/auth/sign_in_form/bloc/sign_in_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffe0e9f8),
        title: Text(
          'Welcome Back!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xffe0e9f8),
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Image.asset('images/loglogin.png'),
                    Expanded(
                      child: BlocProvider(
                        create: (_) => getIt<SignInFormBloc>(),
                        child: SignInForm(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
