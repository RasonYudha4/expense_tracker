import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/app/routes/pages/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AuthBloc bloc) => bloc.state.user);

    return Scaffold(
        body: Column(
      children: [
        HomeAppBar(user: user),
        MainCard(),
        SizedBox(
          height: 10,
        ),
        RecentExpenses(),
        // AddExpenseButton(),
      ],
    ));
  }
}
