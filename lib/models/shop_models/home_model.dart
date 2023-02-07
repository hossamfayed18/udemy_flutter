import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeModel {
  bool? status;

  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<bannerModel> banners = [];

  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(bannerModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class bannerModel {
  int? id;

  String? image;

  bannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;

  dynamic price;

  var old_price;

  var discount;

  String? name;

  String? image;

  String? description;

  bool? in_favorites;

  bool? incart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    in_favorites = json['in_favorites'];
    incart = json['incart'];
  }
}


