import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/bottom_nav/model/bottom_nav_model.dart';
import 'package:prayer_reminder/features/bottom_nav/view_model/bottom_nav_view_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: BlocBuilder<BottomNavViewModel, int>(
        bloc: getIt<BottomNavViewModel>(),
        builder: (context, state) {
          return screens[state];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavViewModel, int>(
        bloc: getIt<BottomNavViewModel>(),
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 0,
            currentIndex: state,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: size.width * 0.03,
            unselectedFontSize: size.width * 0.03,
            backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
            items: items,
            selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor:
                theme.bottomNavigationBarTheme.unselectedItemColor,
            onTap: (index) => getIt<BottomNavViewModel>().onItemTapped(index),
          );
        },
      ),
    );
  }
}
