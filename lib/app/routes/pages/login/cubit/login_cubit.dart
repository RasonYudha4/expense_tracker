import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../data/form_inputs/auth/email.dart';
import '../../../../../data/form_inputs/auth/password.dart';
import '../../../../../data/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthRepo _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      showEmailError: false,
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      showPasswordError: false,
    ));
  }

  Future<void> signInFormSubmitted() async {
    // Convert pure fields to dirty to trigger proper validation
    final email =
        state.email.isPure ? Email.dirty(state.email.value) : state.email;
    final password = state.password.isPure
        ? Password.dirty(state.password.value)
        : state.password;

    // Update state with dirty fields if needed
    if (state.email.isPure || state.password.isPure) {
      emit(state.copyWith(email: email, password: password));
    }

    // First check if form is valid
    if (!state.isValid) {
      // Show validation errors when user clicks login with invalid data
      emit(state.copyWith(
        showEmailError:
            state.email.value.isEmpty || state.email.displayError != null,
        showPasswordError:
            state.password.value.isEmpty || state.password.displayError != null,
      ));
      return;
    }

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      // Your authentication logic here
      await _authenticationRepository.logIn(
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
