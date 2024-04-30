

class CollegeModel {
  String name;
  dynamic stateProvince;
  List<String> domains;
  List<String> webPages;
  String alphaTwoCode;
  String country;

  CollegeModel({
    required this.name,
    required this.stateProvince,
    required this.domains,
    required this.webPages,
    required this.alphaTwoCode,
    required this.country,
  });

  CollegeModel copyWith({
    String? name,
    dynamic stateProvince,
    List<String>? domains,
    List<String>? webPages,
    String? alphaTwoCode,
    String? country,
  }) =>
      CollegeModel(
        name: name ?? this.name,
        stateProvince: stateProvince ?? this.stateProvince,
        domains: domains ?? this.domains,
        webPages: webPages ?? this.webPages,
        alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
        country: country ?? this.country,
      );

  factory CollegeModel.fromJson(Map<String, dynamic> json) => CollegeModel(
    name: json["name"],
    stateProvince: json["state-province"],
    domains: List<String>.from(json["domains"].map((x) => x)),
    webPages: List<String>.from(json["web_pages"].map((x) => x)),
    alphaTwoCode: json["alpha_two_code"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "state-province": stateProvince,
    "domains": List<dynamic>.from(domains.map((x) => x)),
    "web_pages": List<dynamic>.from(webPages.map((x) => x)),
    "alpha_two_code": alphaTwoCode,
    "country": country,
  };
}
