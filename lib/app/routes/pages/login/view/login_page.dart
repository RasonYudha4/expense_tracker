import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/routes/pages/login/login.dart';

import '../../../../../data/repositories/auth_repo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  static Route<void> route() {
    return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginPage(),
      transitionDuration: Duration.zero, // No animation
      reverseTransitionDuration: Duration.zero, // No animation on pop
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D336B),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthRepo>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
