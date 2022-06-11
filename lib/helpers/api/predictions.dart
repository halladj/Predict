import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proto/favorite/favorite_model.dart';
import 'package:proto/helpers/constants.dart';
import 'package:proto/history/history_model.dart';
import 'package:proto/prediction_form/model/cpu/cpu.model.dart';
import 'package:proto/prediction_form/model/gpu/gpu.model.dart';
import 'package:proto/prediction_form/model/pc.model.dart';

class PredictionApi {
  static getPrice(PcInfo data) async {
    try {
      var response = await Dio().post(
          //'https://laptops-prediction.herokuapp.com/result',
          predictionServiceURL,
          data: data.toJson(),
          options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode == 200) {
        return double.parse(response.data['price']);
      } else {
        throw Exception('this is an exception mate ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}

class QrCodeApi {
  static generateQr(PcInfo data, double price) async {
    try {
      var response = await Dio().post('${qrCodeURL}generate',
          data: {"laptop": data.toJson(), "price": price},
          options: Options(
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      print(response);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.data);
        throw Exception('this is an exception mate ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  static scanQrCode({required String hash}) async {
    try {
      var response = await Dio().get('${qrCodeURL}scan/${hash}',
          //data: {"laptop": data.toJson(), "price": price},
          options: Options(
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response);
        throw Exception('this is an exception mate ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}

class FavoriteApi {
  static fetchFavorite(String token) async {
    try {
      final response = await Dio().get('${favoriteURL}',
          //data: {"laptop": data.toJson(), "price": price},
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              //"Bearer 1|u9jkQig3rq7tpo5OYeUQRNX0YKCv2Fmw0kDc6Jfv",
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        return response.data.map((data) => Favorite(
            id: data["id"],
            pc: PcInfo(
                brand: data["brand"],
                cpu: CPU(
                  brand: data["cpu_brand"],
                  family: data["cpu_family"],
                  modifier: data["cpu_modifier"],
                  numberIdentifier: data["cpu_number_identifier"],
                ),
                gpu: GPU(
                    brand: data["gpu_brand"],
                    numberIdentifier: data["cpu_number_identifier"].toString(),
                    vram: data["gpu_vram"]),
                ram: data["ram"],
                ramType: data["ram_type"],
                ramFrequency: double.parse(data["ram_frequency"].toString()),
                hdd: data["hdd"],
                ssd: data["ssd"],
                screenSize: double.parse(data["screen_size"].toString()),
                screenResolution: data["screen_resolution"],
                screenRefreshRate: data["screen_refresh_rate"],
                state: data["state"],
                touchScreen: data["touch_screen"]),
            price: double.parse(data["price"].toString())));
      } else {
        print(response);
        throw Exception('this is a fucking exception mate init');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static addToFavorites(
      {required PcInfo pc,
      required double price,
      required String token}) async {
    try {
      var response = await Dio().post(favoriteURL,
          data: {"laptop": pc.toJson(), "price": price},
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "authorization": "Bearer $token",
            },
            validateStatus: (status) => true,
          ));
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static deleteFavorite(int id, String token) async {
    try {
      final response = await Dio().post('$favoriteURL/$id',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        print("item deleted");
      } else {
        print(response);
        throw Exception(
            'this is a fucking exception mate init code :${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}

class HistoryApi {
  static fetchHistory(String token) async {
    try {
      final response = await Dio().get('${historyURL}',
          //data: {"laptop": data.toJson(), "price": price},
          options: Options(
            headers: {
              "authorization": "Bearer $token",
              //"Bearer 1|u9jkQig3rq7tpo5OYeUQRNX0YKCv2Fmw0kDc6Jfv",
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        return response.data.map((data) => History(
            id: data["id"],
            pc: PcInfo(
                brand: data["brand"],
                cpu: CPU(
                  brand: data["cpu_brand"],
                  family: data["cpu_family"],
                  modifier: data["cpu_modifier"],
                  numberIdentifier: data["cpu_number_identifier"],
                ),
                gpu: GPU(
                    brand: data["gpu_brand"],
                    numberIdentifier: data["cpu_number_identifier"].toString(),
                    vram: data["gpu_vram"]),
                ram: data["ram"],
                ramType: data["ram_type"],
                ramFrequency: double.parse(data["ram_frequency"].toString()),
                hdd: data["hdd"],
                ssd: data["ssd"],
                screenSize: double.parse(data["screen_size"].toString()),
                screenResolution: data["screen_resolution"],
                screenRefreshRate: data["screen_refresh_rate"],
                state: data["state"],
                touchScreen: data["touch_screen"]),
            price: double.parse(data["price"].toString())));
      } else {
        print(response);
        throw Exception('this is a fucking exception mate init');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  static addToHistory(
      {required PcInfo pc,
      required double price,
      required String token}) async {
    try {
      var response = await Dio().post(historyURL,
          data: {"laptop": pc.toJson(), "price": price},
          options: Options(
            contentType: Headers.jsonContentType,
            headers: {
              "authorization": "Bearer $token",
            },
            validateStatus: (status) => true,
          ));
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static deleteHistory(int id, String token) async {
    try {
      final response = await Dio().post('${historyURL}/$id',
          options: Options(
            headers: {
              "authorization": "Bearer $token",
            },
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        print("item deleted");
      } else {
        print(response);
        throw Exception(
            'this is a fucking exception mate init code :${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
