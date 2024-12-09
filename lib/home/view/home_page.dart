import 'package:authentication_repository/src/models/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
        body: Column(
      children: [
        HomeAppBar(user: user),
        MainCard(),
        SizedBox(
          height: 10,
        ),
        RecentExpenses(),
        AddExpenseButton(),
      ],
    ));
  }
}
