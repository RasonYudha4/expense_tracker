import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/size_config.dart';
import '../../../data/enums/navbar_items.dart';
import '../cubit/navigation_cubit.dart';
import 'navigation_button.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double navBarHeight = SizeConfig.height(8.5);
    final double safeNavBarHeight = navBarHeight.clamp(100.0, 120.0);

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Container(
          height: safeNavBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xFFD3E671)),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavButton(
                    icon: Icons.home_outlined,
                    label: 'Home',
                    isSelected: state.navbarItem == NavbarItem.home,
                    navItem: NavbarItem.home,
                  ),
                  NavButton(
                    icon: Icons.bar_chart_rounded,
                    label: 'Evaluation',
                    isSelected: state.navbarItem == NavbarItem.evaluation,
                    navItem: NavbarItem.evaluation,
                  ),
                  NavButton(
                    icon: Icons.camera_alt,
                    label: 'Insert',
                    isSelected: state.navbarItem == NavbarItem.insert,
                    navItem: NavbarItem.insert,
                  ),
                  NavButton(
                    icon: Icons.history,
                    label: 'History',
                    isSelected: state.navbarItem == NavbarItem.history,
                    navItem: NavbarItem.history,
                  ),
                  NavButton(
                    icon: Icons.person,
                    label: 'Profile',
                    isSelected: state.navbarItem == NavbarItem.profile,
                    navItem: NavbarItem.profile,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
