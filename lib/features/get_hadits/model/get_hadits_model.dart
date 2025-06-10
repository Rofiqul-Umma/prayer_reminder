class GetHaditsModel {
  GetHaditsModel({
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  final int code;
  final String message;
  final DataHadits data;
  final bool error;

  factory GetHaditsModel.fromJson(Map<String, dynamic> json) {
    return GetHaditsModel(
      code: json["code"] ?? 0,
      message: json["message"] ?? "",
      data: DataHadits.fromJson(json["data"]),
      error: json["error"] ?? false,
    );
  }
}

class DataHadits {
  DataHadits({
    required this.name,
    required this.id,
    required this.available,
    required this.requested,
    required this.hadiths,
  });

  final String name;
  final String id;
  final int available;
  final int requested;
  final List<Hadith> hadiths;

  factory DataHadits.fromJson(Map<String, dynamic> json) {
    return DataHadits(
      name: json["name"] ?? "",
      id: json["id"] ?? "",
      available: json["available"] ?? 0,
      requested: json["requested"] ?? 0,
      hadiths:
          json["hadiths"] == null
              ? []
              : List<Hadith>.from(
                json["hadiths"]!.map((x) => Hadith.fromJson(x)),
              ),
    );
  }
}

class Hadith {
  Hadith({required this.number, required this.arab, required this.id});

  final int number;
  final String arab;
  final String id;

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      number: json["number"] ?? 0,
      arab: json["arab"] ?? "",
      id: json["id"] ?? "",
    );
  }
}
