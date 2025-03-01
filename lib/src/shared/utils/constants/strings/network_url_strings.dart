// ignore_for_file: constant_identifier_names

class CBUrls{
  const CBUrls._();

  static const BASE_URL = "https://restcountries.com/v3.1";


  //////////////////////////////////
  ////////[ ENDPOINTS ]/////////////
  //////////////////////////////////
  
  static const GET_COUNTRIES = '/region/africa?status=true&fields=name,languages,capital,flags';
  static const GET_A_COUNTRY = '/name/';
}
