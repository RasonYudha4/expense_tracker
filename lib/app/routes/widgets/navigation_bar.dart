import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/enums/navbar_items.dart';
import '../cubit/navigation_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                ),
              ),
              Positioned(
                bottom: 20,
                left: (MediaQuery.of(context).size.width - 370) / 2,
                child: Container(
                  height: 70,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Color(0xFFCFCFCF),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Home Button
                            InkWell(
                              onTap: () {
                                BlocProvider.of<NavigationCubit>(context)
                                    .getNavBarItem(NavbarItem.home);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.home_filled,
                                  size: 28,
                                  color: state.navbarItem == NavbarItem.home
                                      ? Color(0xFF2D336B)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            // Evaluation Button
                            InkWell(
                              onTap: () {
                                BlocProvider.of<NavigationCubit>(context)
                                    .getNavBarItem(NavbarItem.evaluation);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.bar_chart_rounded,
                                  size: 28,
                                  color:
                                      state.navbarItem == NavbarItem.evaluation
                                          ? Color(0xFF2D336B)
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                BlocProvider.of<NavigationCubit>(context)
                                    .getNavBarItem(NavbarItem.history);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.event_note_rounded,
                                  size: 28,
                                  color: state.navbarItem == NavbarItem.history
                                      ? Color(0xFF2D336B)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<NavigationCubit>(context)
                                    .getNavBarItem(NavbarItem.profile);
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  Icons.person,
                                  size: 28,
                                  color: state.navbarItem == NavbarItem.profile
                                      ? Color(0xFF2D336B)
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: (MediaQuery.of(context).size.width - 90) / 2,
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<NavigationCubit>(context)
                        .getNavBarItem(NavbarItem.insert);
                  },
                  borderRadius: BorderRadius.circular(45),
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: state.navbarItem == NavbarItem.insert
                          ? Color(0xFF89AC46)
                          : Color(0xFF2D336B),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xFFF1F1F1),
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
