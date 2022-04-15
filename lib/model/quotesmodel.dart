import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) =>
    RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) =>
    json.encode(data.toJson());

class RestaurantModel {
  String? sts;
  String? msg;
  int? cartcount;
  List<Null>? restaurants;
  List<Nrestaurants>? nrestaurants;

  RestaurantModel(
      {this.sts,
      this.msg,
      this.cartcount,
      this.restaurants,
      this.nrestaurants});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    sts = json['sts'];
    msg = json['msg'];
    cartcount = json['cartcount'];
    restaurants = <Null>[];
    if (json['nrestaurants'] != null) {
      nrestaurants = <Nrestaurants>[];
      json['nrestaurants'].forEach((v) {
        nrestaurants!.add(new Nrestaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sts'] = this.sts;
    data['msg'] = this.msg;
    data['cartcount'] = this.cartcount;
    data['restaurants'] = this.restaurants;
    if (this.nrestaurants != null) {
      data['nrestaurants'] = this.nrestaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Nrestaurants {
  int? id;
  String? name;
  String? logo;
  String? deliveryTime;
  String? promoted;
  num? rating;

  Nrestaurants(
      {this.id,
      this.name,
      this.logo,
      this.deliveryTime,
      this.promoted,
      this.rating});

  Nrestaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    deliveryTime = json['delivery_time'];
    promoted = json['promoted'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['delivery_time'] = this.deliveryTime;
    data['promoted'] = this.promoted;
    data['rating'] = this.rating;
    return data;
  }
}
