import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:proto/login/login.dart';
import 'package:proto/sign_up/sign_up.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo2.png',
                height: 60,
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.fromLTRB(21, 10, 21, 0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: HexColor("#ebf3fb"),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _EmailInput(),
                    const SizedBox(height: 8),
                    _PasswordInput(),
                    _RecoverAccountButton(),
                    const SizedBox(height: 20),
                    _LoginButton(),
                    _SignUpButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.email_rounded, color: HexColor("#4589d7")),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: HexColor("#4589d7"), width: 1.7),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: HexColor("#23456c"), width: 1.7),
            ),
            labelText: 'email',
            labelStyle: TextStyle(color: HexColor("#4589d7")),
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.password, color: HexColor("#4589d7")),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: HexColor("#4589d7"), width: 1.7),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: HexColor("#23456c"), width: 1.7),
            ),
            labelText: 'password',
            labelStyle: TextStyle(color: HexColor("#4589d7")),
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : Container(
                width: 280,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(80)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [HexColor("#4589D7"), HexColor("#D0A0F7")])),
                child: ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: HexColor("#726eff"),
                  ),
                  onPressed: state.status.isValidated
                      ? () => context.read<LoginCubit>().logInWithCredentials()
                      : null,
                  child: const Text('Log in',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_flatButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New user',
            style: TextStyle(
                color: HexColor("#213063"), fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 5),
          Text(
            'Sign up',
            style: TextStyle(
                color: HexColor("#213063"), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _RecoverAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_Recovery_flatButton'),
      onPressed: () => {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Forgot username or password',
            style: TextStyle(
                color: HexColor("#213063"),
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
