import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/enums/navbar_items.dart';
import 'evaluation/blocs/bloc/selected_bloc.dart';
import 'evaluation/views/evaluation.dart';
import 'evaluation/views/evaluation_page.dart';
import 'history/views/history_page.dart';
import 'home/view/dummy.dart';
import 'home/view/home_page.dart';
import '../cubit/navigation_cubit.dart';
import '../widgets/navigation_bar.dart';
import 'insert/widgets/image_picker.dart';
import 'profile/views/profile_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return Dummy();
          } else if (state.navbarItem == NavbarItem.evaluation) {
            return EvaluationPage();
          } else if (state.navbarItem == NavbarItem.insert) {
            return ImagePickerWidget();
          } else if (state.navbarItem == NavbarItem.history) {
            return HistoryPage();
          } else if (state.navbarItem == NavbarItem.profile) {
            // return BlocProvider<SelectedBloc>(
            //   create: (context) => SelectedBloc(),
            //   child: Evaluation(),
            // );
            return ProfilePage();
          }
          return Container();
        },
      ),
    );
  }
}
