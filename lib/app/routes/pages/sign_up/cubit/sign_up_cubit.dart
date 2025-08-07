import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../data/form_inputs/auth/confirm_password.dart';
import '../../../../../data/form_inputs/auth/email.dart';
import '../../../../../data/form_inputs/auth/password.dart';
import '../../../../../data/repositories/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository) : super(const SignUpState());

  final AuthRepo _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        showEmailError: false,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        showPasswordError: false,
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        showConfirmPasswordError: false,
      ),
    );
  }

  Future<void> signUpFormSubmitted() async {
    // Convert pure fields to dirty to trigger proper validation
    final email =
        state.email.isPure ? Email.dirty(state.email.value) : state.email;
    final password = state.password.isPure
        ? Password.dirty(state.password.value)
        : state.password;
    final confirmPassword = state.confirmedPassword.isPure
        ? ConfirmedPassword.dirty(password: password.value)
        : state.confirmedPassword;

    // Update state with dirty fields if needed
    if (state.email.isPure || state.password.isPure) {
      emit(state.copyWith(
          email: email,
          password: password,
          confirmedPassword: confirmPassword));
    }

    // First check if form is valid
    if (!state.isValid) {
      // Show validation errors when user clicks login with invalid data
      emit(state.copyWith(
          showEmailError:
              state.email.value.isEmpty || state.email.displayError != null,
          showPasswordError: state.password.value.isEmpty ||
              state.password.displayError != null,
          showConfirmPasswordError: state.confirmedPassword.value.isEmpty ||
              state.confirmedPassword.displayError != null));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }
}
