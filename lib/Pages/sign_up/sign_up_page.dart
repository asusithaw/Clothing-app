import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/sign_up/widgets/sign_up_form.dart';
import 'package:flutter_app/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffe0e9f8),
        title: Text(
          'Create Account',
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
                    Image.asset('images/logoffice.png'),
                    Expanded(
                      child: BlocProvider(
                        create: (_) => getIt<SignUpFormBloc>(),
                        child: SignUpForm(),
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
