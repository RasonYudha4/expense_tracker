import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_tracker/app/app.dart';

import 'data/repositories/auth_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthRepo();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}
