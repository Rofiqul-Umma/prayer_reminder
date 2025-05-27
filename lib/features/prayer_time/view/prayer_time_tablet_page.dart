import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/clock.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/list_prayers.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/loading.dart';
import 'package:prayer_reminder/features/prayer_time/view/components/location.dart';

class PrayerTimeTabletPage extends StatelessWidget {
  const PrayerTimeTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocListener<GetPrayerViewModel, GetPrayerState>(
                    bloc: getIt<GetPrayerViewModel>(),
                    listener: (context, state) {
                      if (state is GetPrayerSuccessState) {
                        Future.microtask(
                          () =>
                              getIt<GetPrayerViewModel>()
                                  .startPrayerTimeChecker(),
                        );
                      }
                    },
                    child: BlocConsumer<
                      GetCurrentLocationViewModel,
                      GetCurrentLocationState
                    >(
                      bloc: getIt<GetCurrentLocationViewModel>(),
                      listener: (context, state) {
                        if (state is GetCurrentLocationSuccessState) {
                          getIt<GetPrayerViewModel>().getPrayers(
                            "${state.data.subLocality}, ${state.data.locality}, ${state.data.country}",
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is GetCurrentLocationLoadingState) {
                          return Loading();
                        } else if (state is GetCurrentLocationSuccessState) {
                          return Location(state: state);
                        } else if (state is GetCurrentLocationErrorState) {
                          return Text(
                            state.error,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontSize: size.width * 0.015,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return Text(
                            "Something went wrong",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontSize: size.width * 0.015,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Clock(),
                  LottieBuilder.asset(
                    "assets/images/cube.json",
                    width: size.width * 0.25,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              ListPrayers(),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
