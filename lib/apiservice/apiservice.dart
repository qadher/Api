import 'dart:convert';

import 'package:api_test/cartpage.dart';
import 'package:api_test/constant/const.dart';

import '../model/quotesmodel.dart';
import 'package:http/http.dart' as http;

Future<RestaurantModel> fetchQuotes() async {
  final response = await http.post(Uri.parse(
      Api.baseUrl + 'customer/restaurants/view/all?user_id=2&pincode=6735001'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return RestaurantModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
Future<Future<Cart>?> getCart() async {
  final response = await http
      .post(Uri.parse("https://ebshosting.co.in/api/getcart?user_id=3"));

  if (response.statusCode == 200) {
    return Cart.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
