class LocationModel {
  final String coordinates;
  final String subLocality;
  final String locality;
  final String country;
  final String message;

  const LocationModel({
    required this.coordinates,
    required this.subLocality,
    required this.locality,
    required this.country,
    required this.message,
  });

  LocationModel copyWith({
    String? coordinates,
    String? subLocality,
    String? locality,
    String? country,
    String? message,
    bool? isLoading,
  }) {
    return LocationModel(
      coordinates: coordinates ?? this.coordinates,
      subLocality: subLocality ?? this.subLocality,
      locality: locality ?? this.locality,
      country: country ?? this.country,
      message: message ?? this.message,
    );
  }
}
