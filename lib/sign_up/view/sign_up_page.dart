import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/sign_up/sign_up.dart';

import '../../data/repositories/auth_repo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpPage(),
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
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<AuthRepo>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
