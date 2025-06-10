import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/get_hadits/view_model/get_hadits_view_model.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/card_prayer.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';

class Prayer extends StatelessWidget {
  const Prayer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      top: false,
      child: BlocBuilder(
        bloc: getIt<GetPrayerViewModel>(),
        builder: (context, state) {
          if (state is GetPrayerSuccessState) {
            return CardPrayer(
              data: state.data,
              hadith: getIt<GetHaditsViewModel>().currentQuote,
            );
          } else if (state is GetPrayerErrorState) {
            return Text(
              state.error,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.error,
              ),
            );
          } else {
            return Loading();
          }
        },
      ),
    );
  }
}
