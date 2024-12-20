import 'package:expense_tracker/evaluation/blocs/bloc/selected_bloc.dart';
import 'package:expense_tracker/evaluation/view/evaluation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/home/home.dart';
import 'package:expense_tracker/landing_screen/bloc/landing_screen_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.analytics_outlined),
    label: 'Evaluation',
  ),
];

List<Widget> bottomNavScreen(BuildContext context) {
  return <Widget>[
    HomePage(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedBloc(),
        ),
      ],
      child: EvaluationPage(),
    ),
  ];
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LandingScreen());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingScreenBloc, LandingScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body:
              Center(child: bottomNavScreen(context).elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingScreenBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
