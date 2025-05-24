import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/home/view/components/clock.dart';
import 'package:prayer_reminder/features/home/view/components/list_prayers.dart';
import 'package:prayer_reminder/features/home/view/components/loading.dart';
import 'package:prayer_reminder/features/home/view/components/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GetPrayerViewModel getPrayerVM;
  late final GetCurrentLocationViewModel getCurrentLocationVM;
  @override
  void initState() {
    // Initialize the prayer view model here
    getPrayerVM = getIt.get<GetPrayerViewModel>();
    // Initialize the current location view model here
    getCurrentLocationVM = getIt.get<GetCurrentLocationViewModel>();
    // get the current location
    getCurrentLocationVM.fetchCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              BlocListener(
                bloc: getPrayerVM,
                listener: (context, state) {
                  if (state is GetPrayerSuccessState) {
                    Future.microtask(
                      () => getPrayerVM.startPrayerTimeChecker(),
                    );
                  }
                },
                child: BlocConsumer(
                  bloc: getCurrentLocationVM,
                  listener: (context, state) {
                    if (state is GetCurrentLocationSuccessState) {
                      getPrayerVM.getPrayers(
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return Text(
                        "Something went wrong",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: size.width * 0.035,
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
              Expanded(child: LottieBuilder.asset("assets/images/cube.json")),
              ListPrayers(getPrayerVM: getPrayerVM),
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
