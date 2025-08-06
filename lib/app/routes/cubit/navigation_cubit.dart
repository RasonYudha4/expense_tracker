import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/enums/navbar_items.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.evaluation:
        emit(NavigationState(NavbarItem.evaluation, 1));
        break;
      case NavbarItem.insert:
        emit(NavigationState(NavbarItem.insert, 2));
        break;
      case NavbarItem.history:
        emit(NavigationState(NavbarItem.history, 3));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 4));
        break;
    }
  }
}
