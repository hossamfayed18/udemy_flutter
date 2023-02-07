import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Dio_helper {

static Dio ? dio ;

 static init (){
   dio=Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       receiveDataWhenStatusError: true,
       /*headers: {
         'lang':'ar',
         'Content-Type':'application/json',
       }*/

     ),

   );



 }

static Future<Response> getData({
  required String url ,
    Map<String,dynamic> ? query ,
    String ? token ,
}) async {

   dio!.options.headers = {
     'lang': 'en',
     'Content-Type': 'application/json',
      'Authorization' : token,
   };
  return await dio!.get(url, queryParameters: query);
}

static Future<Response> postData({
  required String url ,
  Map<String,dynamic> ? query,
  String ? token ,
  required  Map<String,dynamic> data
}) async {

   dio!.options.headers= {
     'lang': 'en',
     'Content-Type': 'application/json',
     'Authorization' : token
   } ;
  return await dio!.post(
      url,
    queryParameters: query,
    data: data,
  );
}


static Future<Response> putData({
  required String url ,
  Map<String,dynamic> ? query,
  String ? token ,
  required  Map<String,dynamic> data
}) async {

  dio!.options.headers= {
    'lang': 'en',
    'Content-Type': 'application/json',
    'Authorization' : token
  } ;
  return await dio!.put(
    url,
    queryParameters: query,
    data: data,
  );
}




}

