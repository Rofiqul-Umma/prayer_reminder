import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/prayer_time/view/prayer_time_tablet_page.dart';
import 'package:prayer_reminder/features/settings/view/settings_tablet_page.dart';
import 'package:prayer_reminder/features/task_manager/view/task_manager_tablet_page.dart';

class SiderBarMenu extends StatefulWidget {
  const SiderBarMenu({super.key});

  @override
  State<SiderBarMenu> createState() => _SiderBarMenuState();
}

class _SiderBarMenuState extends State<SiderBarMenu> {
  final _controller = SideMenuController();
  final _pageController = PageController();

  late final List<SideMenuItem> itemSide;

  @override
  void initState() {
    itemSide = [
      SideMenuItem(
        title: 'Prayer Time',
        icon: Icon(HugeIcons.strokeRoundedCalendar02),
        onTap: (index, _) {
          _controller.changePage(index);
          _pageController.jumpToPage(index);
        },
      ),
      SideMenuItem(
        title: 'Task Manager',
        icon: const Icon(HugeIcons.strokeRoundedFlow),
        onTap: (index, _) {
          _controller.changePage(index);
          _pageController.jumpToPage(index);
        },
      ),
      SideMenuItem(
        title: 'Settings',
        icon: const Icon(HugeIcons.strokeRoundedSettings02),
        onTap: (index, _) {
          _controller.changePage(index);
          _pageController.jumpToPage(index);
        },
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    itemSide.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Row(
          children: [
            SideMenu(
              items: itemSide,
              controller: _controller,
              style: SideMenuStyle(
                toggleColor: Theme.of(context).colorScheme.onSurface,
                displayMode: SideMenuDisplayMode.auto,
                selectedIconColor: Theme.of(context).colorScheme.onSurface,
                unselectedIconColor: Theme.of(context).colorScheme.onSurface,
                selectedColor: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withAlpha(40),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                selectedTitleTextStyle: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                unselectedTitleTextStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  PrayerTimeTabletPage(),
                  TaskManagerTabletPage(),
                  SettingsTabletPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
