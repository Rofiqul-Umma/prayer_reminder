import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/core/get_it_config.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/card_prayer.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';

class ListPrayers extends StatelessWidget {
  const ListPrayers({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: BlocBuilder(
        bloc: getIt<GetPrayerViewModel>(),
        builder: (context, state) {
          if (state is GetPrayerSuccessState) {
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder:
                  (context, index) => SizedBox(height: size.height * 0.01),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return CardPrayer(index: index, state: state);
              },
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
