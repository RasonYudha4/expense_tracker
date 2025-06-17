part of 'login_cubit.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool showEmailError;
  final bool showPasswordError;
  final String? errorMessage;

  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.showEmailError = false,
    this.showPasswordError = false,
    this.errorMessage,
  });

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? showEmailError,
    bool? showPasswordError,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      showEmailError: showEmailError ?? this.showEmailError,
      showPasswordError: showPasswordError ?? this.showPasswordError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => Formz.validate([email, password]);

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        showEmailError,
        showPasswordError,
        errorMessage
      ];
}
