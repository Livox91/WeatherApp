class CityCountry {
  final String city;
  final String country;

  CityCountry(this.city, this.country);

  Map<String, dynamic> toJson() {
    return {'city': city, 'country': country};
  }

  factory CityCountry.fromJson(Map<String, dynamic> json) {
    return CityCountry(json['city'], json['country']);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityCountry &&
          runtimeType == other.runtimeType &&
          city == other.city &&
          country == other.country;

  @override
  int get hashCode => city.hashCode ^ country.hashCode;
}
