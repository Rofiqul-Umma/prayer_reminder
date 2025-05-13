import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lottie/lottie.dart';
import 'package:prayer_reminder/core/DI.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_loc_view_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_state.dart';
import 'package:prayer_reminder/features/get_prayer/view_model/get_prayer_view_model.dart';

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
    getPrayerVM = getIt<GetPrayerViewModel>();
    // Initialize the current location view model here
    getCurrentLocationVM = getIt<GetCurrentLocationViewModel>();
    // get the current location
    getCurrentLocationVM.fetchCurrentLocation();
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
              SizedBox(height: size.height * 0.05),
              BlocConsumer(
                bloc: getCurrentLocationVM,
                listener: (context, state) {
                  if (state is GetCurrentLocationSuccessState) {
                    getPrayerVM.getNearestPrayerTime(
                      "${state.data.subLocality}, ${state.data.locality}, ${state.data.country}",
                    );
                  }
                },
                builder: (context, state) {
                  if (state is GetCurrentLocationLoadingState) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (state is GetCurrentLocationSuccessState) {
                    return Column(
                      spacing: 6,
                      children: [
                        Icon(
                          HugeIcons.strokeRoundedLocation01,
                          size: size.width * 0.04,
                          color: Colors.white,
                        ),
                        Text(
                          state.data.subLocality,
                          style: TextStyle(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w600,
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
              Text(
                "${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: size.width * 0.1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Expanded(child: LottieBuilder.asset("assets/images/cube.json")),
              BlocBuilder(
                bloc: getPrayerVM,
                builder: (context, state) {
                  if (state is GetPrayerLoadingState) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (state is GetPrayerSuccessState) {
                    return Column(
                      children: [
                        Text(
                          state.data.name,
                          style: TextStyle(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          state.data.time,
                          style: TextStyle(
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
              SizedBox(height: size.height * 0.07),
            ],
          ),
        ),
      ),
    );
  }
}
