import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/routes/pages/login/login.dart';
import 'package:expense_tracker/app/routes/pages/sign_up/sign_up.dart';
import 'package:formz/formz.dart';

import '../../../../../data/form_inputs/auth/email.dart';
import '../../../../../data/form_inputs/auth/password.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
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
                'assets/Logo.png',
              ),
              const SizedBox(height: 40),
              Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(
                height: 30,
              ),
              _EmailInput(),
              const SizedBox(height: 35),
              _PasswordInput(),
              const SizedBox(height: 40),
              _LoginButton(),
              const SizedBox(height: 70),
              _SignUpButton(),
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
      builder: (context, state) {
        // Check if we should show errors
        String errorText = '';
        if (state.showEmailError) {
          switch (state.email.displayError) {
            case EmailValidationError.empty:
              errorText = 'Email is required';
              break;
            case EmailValidationError.invalid:
              errorText = 'Please enter a valid email address';
              break;
            case null:
              break;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
                border: errorText.isNotEmpty
                    ? Border.all(color: Colors.red, width: 1.5)
                    : null,
              ),
              child: TextField(
                key: const Key('loginForm_emailInput_textField'),
                onChanged: (email) =>
                    context.read<LoginCubit>().emailChanged(email),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 8.0),
                        child: Icon(Icons.mail_outline, color: Colors.grey),
                      ),
                      Container(
                        height: 24.0,
                        width: 1.0,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 1.0),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                  hintText: 'Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            ),
            Center(
              child: Text(
                errorText,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        // Check if we should show errors
        String errorText = '';
        if (state.showPasswordError) {
          switch (state.password.displayError) {
            case PasswordValidationError.empty:
              errorText = 'Password is required';
              break;
            case PasswordValidationError.tooShort:
              errorText = 'Password must be at least 6 characters';
              break;
            case PasswordValidationError.weak:
              errorText = 'Password must contain uppercase letter and number';
              break;
            case null:
              break;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(10),
                border: errorText.isNotEmpty
                    ? Border.all(color: Colors.red, width: 1.5)
                    : null,
              ),
              child: TextField(
                key: const Key('loginForm_passwordInput_textField'),
                onChanged: (password) =>
                    context.read<LoginCubit>().passwordChanged(password),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.0, right: 8.0),
                        child: Icon(Icons.lock_rounded, color: Colors.grey),
                      ),
                      Container(
                        height: 24.0,
                        width: 1.0,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 1.0),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                  hintText: 'Password',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            ),
            Center(
              child: Text(
                errorText,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor:
              isInProgress ? const Color(0xFF7886C7) : const Color(0xFFA9B5DF),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
      onPressed: () => context.read<LoginCubit>().signInFormSubmitted(),
      child: const Text(
        'Sign In',
        style: TextStyle(color: Color(0xFF3C404F), fontSize: 20),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account yet?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextButton(
          key: const Key('loginForm_createAccount_flatButton'),
          onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
          child: Text(
            'Sign Up',
            style: TextStyle(color: Color(0xFFA9B5DF)),
          ),
        ),
      ],
    );
  }
}
