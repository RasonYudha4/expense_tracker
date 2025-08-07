import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/routes/pages/sign_up/sign_up.dart';
import 'package:formz/formz.dart';

import '../../../../../data/form_inputs/auth/confirm_password.dart';
import '../../../../../data/form_inputs/auth/email.dart';
import '../../../../../data/form_inputs/auth/password.dart';
import '../../login/view/login_page.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/Logo.png',
            ),
            const SizedBox(height: 40),
            Text(
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _ConfirmPasswordInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
            const SizedBox(
              height: 70,
            ),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                    context.read<SignUpCubit>().emailChanged(email),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                key: const Key('signUpForm_passwordInput_textField'),
                onChanged: (password) =>
                    context.read<SignUpCubit>().passwordChanged(password),
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

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        // Check if we should show errors
        String errorText = '';
        if (state.showConfirmPasswordError) {
          switch (state.confirmedPassword.displayError) {
            case ConfirmedPasswordValidationError.empty:
              errorText = 'Please confirm your password';
              break;
            case ConfirmedPasswordValidationError.mismatch:
              errorText = 'Passwords do not match';
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
                key: const Key('signUpForm_confirmedPasswordInput_textField'),
                onChanged: (confirmPassword) => context
                    .read<SignUpCubit>()
                    .confirmedPasswordChanged(confirmPassword),
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
                  hintText: 'Confirm Password',
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

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignUpCubit cubit) => cubit.state.status.isInProgress,
    );

    return ElevatedButton(
      key: const Key('signUpForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor:
              isInProgress ? const Color(0xFFA9B5DF) : const Color(0xFFA9B5DF),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
      onPressed: () => context.read<SignUpCubit>().signUpFormSubmitted(),
      child: const Text(
        'Sign In',
        style: TextStyle(color: Color(0xFF3C404F), fontSize: 20),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextButton(
          key: const Key('loginForm_createAccount_flatButton'),
          onPressed: () => Navigator.of(context).push<void>(LoginPage.route()),
          child: Text(
            'Sign In',
            style: TextStyle(color: Color(0xFFA9B5DF)),
          ),
        ),
      ],
    );
  }
}
