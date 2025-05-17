import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';
import 'package:prayer_reminder/features/home/view/components/clock.dart';
import 'package:prayer_reminder/features/home/view/components/list_prayers.dart';

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
    // get the prayer times
    getPrayerVM.startPrayerTimeChecker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              BlocConsumer(
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
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (state is GetCurrentLocationSuccessState) {
                    return Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedLocation01,
                          size: size.width * 0.04,
                          color: Colors.white,
                        ),
                        Text(
                          state.data.subLocality,
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetCurrentLocationErrorState) {
                    return Text(
                      state.error,
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return Text(
                      "Something went wrong",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    );
                  }
                },
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
