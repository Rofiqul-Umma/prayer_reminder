import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayer_reminder/features/get_current_loc/model/location_model.dart';
import 'package:prayer_reminder/features/get_current_loc/view_model/get_current_location_state.dart';

// Part 2: Define the Location Cubit
class GetCurrentLocationViewModel extends Cubit<GetCurrentLocationState> {
  GetCurrentLocationViewModel() : super(GetCurrentLocationInitialState());

  Future<void> fetchCurrentLocation() async {
    emit(GetCurrentLocationLoadingState());

    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(
        GetCurrentLocationErrorState(
          "Location services are disabled. Please enable them.",
        ),
      );
      return;
    }

    // Check and request location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(
          GetCurrentLocationErrorState(
            "Location permissions are denied. Please allow them.",
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(
        GetCurrentLocationErrorState(
          "Location permissions are permanently denied. Please enable them in settings.",
        ),
      );
      return;
    }

    try {
      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 10,
        ),
      );

      // Get address details from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      print(
        "Current Location: ${place.subLocality}, ${place.locality}, ${place.country}",
      );

      emit(
        GetCurrentLocationSuccessState(
          LocationModel(
            coordinates: "${position.latitude}, ${position.longitude}",
            subLocality: place.subLocality ?? "Unknown",
            locality: place.locality ?? "Unknown",
            country: place.country ?? "Unknown",
            message: "Location fetched successfully",
          ),
        ),
      );
    } catch (e) {
      emit(GetCurrentLocationErrorState("$e"));
    }
  }
}
