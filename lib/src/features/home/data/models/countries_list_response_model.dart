class CountriesResponseModel {
  final List<Country>? countries;

  CountriesResponseModel({this.countries});

  factory CountriesResponseModel.fromJson(List<dynamic> jsonList) {
    return CountriesResponseModel(
      countries: jsonList.map((json) => Country.fromJson(json)).toList(),
    );
  }
}



class Country {
  final Flags? flags;
  final Name? name;
  final List<String>? capital;
  final Map<String, String>? languages;

  Country({this.flags, this.name, this.capital, this.languages});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
    name: json['name'] != null ? Name.fromJson(json['name']) : null,
    capital: json['capital'] != null
      ? List<String>.from(json['capital'])
      : null,
    languages: json['languages'] != null
      ? Map<String, String>.from(json['languages'])
      : null,
  );
}

class Flags {
  final String? png;
  final String? svg;
  final String? alt;

  Flags({this.png, this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
    png: json['png'] as String?,
    svg: json['svg'] as String?,
    alt: json['alt'] as String?,
  );

  @override
  toString() => 'flag description: $alt';
}

class Name {
  final String? common;
  final String? official;
  final Map<String, NativeName>? nativeName;

  Name({this.common, this.official, this.nativeName});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json['common'] as String?,
    official: json['official'] as String?,
    nativeName: json['nativeName'] != null
      ? (json['nativeName'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            NativeName.fromJson(value as Map<String, dynamic>),
          ),
        )
      : null,
  );

  @override
  toString() => 'common name: $common, official name: $official, native name: ${nativeName.toString()}';
}


class NativeName {
  final String? official;
  final String? common;

  NativeName({this.official, this.common});

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    official: json['official'] as String?,
    common: json['common'] as String?,
  );

  @override
  toString() => '{Common Native Name: $common, Official Native Name: $official}';
}
