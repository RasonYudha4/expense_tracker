part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzSubmissionStatus status;
  final bool showEmailError;
  final bool showPasswordError;
  final bool showConfirmPasswordError;
  final String? errorMessage;

  const SignUpState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.showEmailError = false,
    this.showPasswordError = false,
    this.showConfirmPasswordError = false,
    this.errorMessage,
  });

  SignUpState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzSubmissionStatus? status,
    bool? showEmailError,
    bool? showPasswordError,
    bool? showConfirmPasswordError,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      showEmailError: showEmailError ?? this.showEmailError,
      showPasswordError: showPasswordError ?? this.showPasswordError,
      showConfirmPasswordError:
          showConfirmPasswordError ?? this.showConfirmPasswordError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => Formz.validate([email, password, confirmedPassword]);

  @override
  List<Object?> get props => [
        email,
        password,
        confirmedPassword,
        status,
        errorMessage,
        showEmailError,
        showPasswordError,
        showConfirmPasswordError,
      ];
}
