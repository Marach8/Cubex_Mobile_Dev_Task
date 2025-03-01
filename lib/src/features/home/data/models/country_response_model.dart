import 'package:cubex_mobile_dev_task/src/shared/utils/helpers/helpers_export.dart';

import 'countries_list_response_model.dart';

class CountryDetailResponseModel {
  final List<CountryData>? country;

  CountryDetailResponseModel({this.country});

  factory CountryDetailResponseModel.fromJson(List<dynamic> jsonList) {
    return CountryDetailResponseModel(
      country: jsonList.map((json) => CountryData.fromJson(json)).toList(),
    );
  }
}


class CountryData {
  final Name? name;
  final List<String>? tld;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final String? cioc;
  final bool? independent;
  final String? status;
  final bool? unMember;
  final Map<String, Currency>? currencies;
  final Idd? idd;
  final List<String>? capital;
  final List<String>? altSpellings;
  final String? region;
  final String? subregion;
  final Map<String, String>? languages;
  final Map<String, Translation>? translations;
  final List<double>? latlng;
  final bool? landlocked;
  final List<String>? borders;
  final double? area;
  final Map<String, Demonyms>? demonyms;
  final String? flag;
  final Maps? maps;
  final int? population;
  final String? fifa;
  final Car? car;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;
  final CoatOfArms? coatOfArms;
  final String? startOfWeek;
  final CapitalInfo? capitalInfo;

  CountryData({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      tld: json['tld'] != null ? List<String>.from(json['tld']) : null,
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      unMember: json['unMember'],
      currencies: json['currencies'] != null
          ? Map.from(json['currencies']).map((k, v) => MapEntry(k, Currency.fromJson(v)))
          : null,
      idd: json['idd'] != null ? Idd.fromJson(json['idd']) : null,
      capital: json['capital'] != null ? List<String>.from(json['capital']) : null,
      altSpellings: json['altSpellings'] != null ? List<String>.from(json['altSpellings']) : null,
      region: json['region'],
      subregion: json['subregion'],
      languages: json['languages'] != null ? Map<String, String>.from(json['languages']) : null,
      translations: json['translations'] != null
          ? Map.from(json['translations']).map((k, v) => MapEntry(k, Translation.fromJson(v)))
          : null,
      latlng: json['latlng'] != null ? List<double>.from(json['latlng']) : null,
      landlocked: json['landlocked'],
      borders: json['borders'] != null ? List<String>.from(json['borders']) : null,
      area: json['area']?.toDouble(),
      demonyms: json['demonyms'] != null
          ? Map.from(json['demonyms']).map((k, v) => MapEntry(k, Demonyms.fromJson(v)))
          : null,
      flag: json['flag'],
      maps: json['maps'] != null ? Maps.fromJson(json['maps']) : null,
      population: json['population'],
      fifa: json['fifa'],
      car: json['car'] != null ? Car.fromJson(json['car']) : null,
      timezones: json['timezones'] != null ? List<String>.from(json['timezones']) : null,
      continents: json['continents'] != null ? List<String>.from(json['continents']) : null,
      flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
      coatOfArms: json['coatOfArms'] != null ? CoatOfArms.fromJson(json['coatOfArms']) : null,
      startOfWeek: json['startOfWeek'],
      capitalInfo: json['capitalInfo'] != null ? CapitalInfo.fromJson(json['capitalInfo']) : null,
    );
  }


  Map<String, String> get mapOfFields => {
    'name': name.toString(),
    'tld': tld?.join(', ') ?? '',
    'cca2': cca2 ?? '',
    'ccn3': ccn3 ?? '',
    'cca3': cca3 ?? '',
    'cioc': cioc ?? '',
    'independent': independent.toString(),
    'status': status ?? '',
    'unMember': unMember.toString(),
    'currencies': currencies.mapToString(),
    'idd': idd.toString(),
    'capital': capital?.join(', ') ?? '',
    'altSpellings': altSpellings?.join(' ') ?? '',
    'region': region ?? '',
    'subregion': subregion ?? '',
    'languages': languages.mapToString(),
    'translations': translations.mapToString(),
    'latlng': latlng?.join(', ') ?? '',
    'landlocked': landlocked.toString(),
    'borders': borders?.join(', ') ?? '',
    'area': area.toString(),
    'demonyms': demonyms.mapToString(),
    'maps': maps.toString(),
    'population': population.toString(),
    'fifa': fifa ?? '',
    'car': car.toString(),
    'timezones': timezones?.join(', ') ?? '',
    'continents': continents?.join(', ') ?? '',
    'startOfWeek': startOfWeek ?? '',
    'capitalInfo': capitalInfo.toString(),
  };
}


class Currency {
  final String? name;
  final String? symbol;

  Currency({
    this.name,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'],
      symbol: json['symbol'],
    );
  }

  @override
  toString() => 'name = $name, symbol = $symbol';
}

class Idd {
  final String? root;
  final List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) {
    return Idd(
      root: json['root'],
      suffixes: json['suffixes'] != null ? List<String>.from(json['suffixes']) : null,
    );
  }

  @override
  toString() => 'root = $root, suffixes = (${suffixes?.join(',')})';
}

class Translation {
  final String? official;
  final String? common;

  Translation({
    this.official,
    this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      official: json['official'],
      common: json['common'],
    );
  }

  @override
  toString() => 'official = $official, common = $common';
}


class Demonyms {
  final Demonym? eng;
  final Demonym? fra;

  Demonyms({
    this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) {
    return Demonyms(
      eng: json['eng'] != null ? Demonym.fromJson(json['eng']) : null,
      fra: json['fra'] != null ? Demonym.fromJson(json['fra']) : null,
    );
  }

  @override
  toString() => 'eng = (${eng.toString()}), fra = (${fra.toString()})';
}

class Demonym {
  final String? f;
  final String? m;

  Demonym({
    this.f,
    this.m,
  });

  factory Demonym.fromJson(Map<String, dynamic> json) {
    return Demonym(
      f: json['f'],
      m: json['m'],
    );
  }

  @override
  toString() => 'f = $f, m = $m';
}


class Maps {
  final String? googleMaps;
  final String? openStreetMaps;

  Maps({
    this.googleMaps,
    this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json['googleMaps'],
      openStreetMaps: json['openStreetMaps'],
    );
  }

  @override
  toString() => 'googleMaps = $googleMaps, openStreetMaps = $openStreetMaps';
}

class Car {
  final List<String>? signs;
  final String? side;

  Car({
    this.signs,
    this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      signs: json['signs'] != null ? List<String>.from(json['signs']) : null,
      side: json['side'],
    );
  }

  @override
  toString() => 'side = $side, signs = (${signs?.join(', ')})';
}


class CoatOfArms {
  final String? png;
  final String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) {
    return CoatOfArms(
      png: json['png'],
      svg: json['svg'],
    );
  }
}

class CapitalInfo {
  final List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) {
    return CapitalInfo(
      latlng: json['latlng'] != null ? List<double>.from(json['latlng']) : null,
    );
  }

  @override
  toString() => 'latlng = ${latlng?.join()}';
}