import 'dart:convert';

import 'package:frikiteam/models/places/city.dart';
import 'package:frikiteam/models/places/country.dart';
import 'package:frikiteam/models/places/disctrict.dart';
import 'package:frikiteam/models/places/place.dart';
import 'package:frikiteam/models/places/place_response.dart';
import 'package:frikiteam/models/shared/pageable_response.dart';
import 'package:frikiteam/services/common/http.common.dart';
import 'package:http/http.dart' as http;

class PlaceService {
  Future<List<Country>> getAllCountries() async {
    var response = await http.get(Uri.parse('$basePath/countries'));
    PageableResponse pageableResponse = PageableResponse.fromJson(json.decode(response.body));
    List<Country> countries = pageableResponse.content.map((e) => Country.fromJson(e)).toList();
    return countries;
  }

  Future<List<City>> getAllCities(int countryId) async {
    var response = await http.get(Uri.parse('$basePath/countries/$countryId/cities'));
    var listCities = jsonDecode(response.body) as List;
    List<City> cities = listCities.map((e) => City.fromJson(e)).toList();
    return cities; 
  }

  Future<List<District>> getAllDistricts(int cityId) async {
    var response = await http.get(Uri.parse('$basePath/cities/$cityId/districts'));
    var listDistricts = jsonDecode(response.body) as List;
    return listDistricts.map((e) => District.fromJson(e)).toList();
  }

  Future createPlace(int districtId, Place place) async {
    var response = await http.post(
      Uri.parse('$basePath/districts/$districtId/places'),
      body: jsonEncode(place),
      headers: {"Content-Type": "application/json"}
    );

    return Place.fromJson(jsonDecode(response.body));
  }
  
  Future<PlaceResponse> getPlaceById(int placeId) async {
    final response = await http.get(
      Uri.parse('$basePath/districts/1/places/$placeId')
    );
    PlaceResponse placeResponse = PlaceResponse.fromJson(jsonDecode(response.body));
    return placeResponse;
  }
}