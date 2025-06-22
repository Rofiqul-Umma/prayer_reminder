import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:prayer_reminder/features/stopwatch/view/stopwatch_page.dart';
import 'package:prayer_reminder/features/utilities/view/components/custom_card_menu.dart';
import 'package:prayer_reminder/features/utilities/view/theme_page.dart';

class UtilitiesPage extends StatelessWidget {
  const UtilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'Utilities',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: theme.colorScheme.onSurface,
            fontSize: size.width * 0.06,
            fontWeight: theme.appBarTheme.titleTextStyle?.fontWeight,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.01),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: size.width * 0.045,
              bottom: size.height * 0.01,
            ),
            color: theme.scaffoldBackgroundColor,
            child: Text(
              'Explore various utilities to enhance your experience',
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: size.width * 0.035,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: GridView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: size.width * 0.02,
            crossAxisSpacing: size.width * 0.02,
            childAspectRatio: 1,
          ),
          children: [
            CustomCardMenu(
              page: const ThemePage(),
              title: 'Theme Settings',
              icon: HugeIcons.strokeRoundedMoon01,
            ),
            CustomCardMenu(
              title: 'Calculator',
              icon: HugeIcons.strokeRoundedCalculator,
            ),
            CustomCardMenu(
              title: 'Currency Converter',
              icon: HugeIcons.strokeRoundedDollarCircle,
            ),
            CustomCardMenu(
              page: const StopwatchPage(),
              title: 'Stopwatch',
              icon: HugeIcons.strokeRoundedStopWatch,
            ),
            CustomCardMenu(
              title: 'Flashlight',
              icon: HugeIcons.strokeRoundedFlashlight,
            ),
            CustomCardMenu(
              title: 'QR Code Scanner',
              icon: HugeIcons.strokeRoundedQrCode,
            ),
            // Add your utility widgets here
            // Example: UtilityCard(title: 'Theme Settings', icon: Icons.color_lens, onTap: () {}),
            // Example: UtilityCard(title: 'Calculator', icon: Icons.calculate, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
