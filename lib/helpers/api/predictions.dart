import 'package:dio/dio.dart';
import 'package:proto/helpers/constants.dart';
import 'package:proto/prediction_form/model/pc.model.dart';

class PredictionApi {
  static getPrice(PcInfo data) async {
    try {
      var response = await Dio().post(
          //'https://laptops-prediction.herokuapp.com/result',
          predictionServiceURL,
          data: data.toJson(),
          options: Options(contentType: Headers.jsonContentType));
      return double.parse(response.data['price']);
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
      return response.toString();
    } catch (e) {
      print(e);
    }
  }

  static scanQrCode({String hash = "12"}) async {
    try {
      var response = await Dio().get('${qrCodeURL}scan/${hash}',
          //data: {"laptop": data.toJson(), "price": price},
          options: Options(
            contentType: Headers.jsonContentType,
            validateStatus: (status) => true,
          ));
      print(">>>>>>>>>>>>>>>>>>>>>${response}");
      return double.parse(response.toString());
    } catch (e) {
      print(e);
    }
  }
}
