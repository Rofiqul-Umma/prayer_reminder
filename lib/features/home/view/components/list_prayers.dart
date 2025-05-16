import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/home/view/components/card_prayer.dart';

class ListPrayers extends StatelessWidget {
  final GetPrayerViewModel getPrayerVM;
  const ListPrayers({super.key, required this.getPrayerVM});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: BlocBuilder(
        bloc: getPrayerVM,
        builder: (context, state) {
          if (state is GetPrayerLoadingState) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is GetPrayerSuccessState) {
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
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            );
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
