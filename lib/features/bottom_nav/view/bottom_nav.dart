import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/bottom_nav/model/bottom_nav_model.dart';
import 'package:prayer_reminder/features/bottom_nav/view_model/bottom_nav_view_model.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late final BottomNavViewModel bottomNavVM;
  @override
  void initState() {
    bottomNavVM = getIt.get<BottomNavViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get the theme from the context
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: BlocBuilder<BottomNavViewModel, int>(
        bloc: bottomNavVM,
        builder: (context, state) {
          return screens[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavViewModel, int>(
        bloc: bottomNavVM,
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 0,
            currentIndex: state,
            backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
            items: items,
            selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                theme.bottomNavigationBarTheme.unselectedItemColor,
            onTap: (index) => bottomNavVM.onItemTapped(index),
          );
        },
      ),
    );
  }
}
