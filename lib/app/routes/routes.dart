import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/landing_screen/bloc/landing_screen_bloc.dart';
import 'package:expense_tracker/landing_screen/view/landing_screen.dart';
import 'package:expense_tracker/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [
        MaterialPage(
          child: BlocProvider(
            create: (_) => LandingScreenBloc(),
            child: const LandingScreen(),
          ),
        ),
      ];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
