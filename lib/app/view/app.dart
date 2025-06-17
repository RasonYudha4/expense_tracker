import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/app/app.dart';

import '../../data/repositories/auth_repo.dart';

class App extends StatelessWidget {
  const App({
    required AuthRepo authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthRepo _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        )..add(const AppUserSubscriptionRequested()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(
            builder: (context) {
              return FlowBuilder<AppStatus>(
                state: context.select((AppBloc bloc) => bloc.state.status),
                onGeneratePages: onGenerateAppViewPages,
              );
            },
          ),
        ),
      ),
    );
  }
}

// class AppView extends StatelessWidget {
//   const AppView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FlowBuilder<AppStatus>(
//       state: context.select((AppBloc bloc) => bloc.state.status),
//       onGeneratePages: onGenerateAppViewPages,
//     );
//   }
// }
