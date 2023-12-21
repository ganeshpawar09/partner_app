import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:partner_flutter_app/server_url.dart';

class PartnerState with ChangeNotifier {
  LocalStorage storage =  LocalStorage('usertoken');
  String? _getPartnerDetails;

  Future<Object> getcompanydetails() async {
    String url = serversite + '/api/get_partner_details/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      List<PartnerState> demo = [];
      if (data['error'] == false) {
        _getPartnerDetails = data['data'];
        print("sucess get company name 1");
//        _rfqPartnerPrice = demo[0];
        notifyListeners();
        //return _getPartnerDetails;
      } else {
        print("something went wrong from server side error=True");
        return false;
      }
    } catch (e) {
      print("error getPartnerDatas");
      print(e);
      return ErrorHint("No Company Name");
    }
    return ErrorHint('Error');
  }

  String? getcompanyname() {
    return _getPartnerDetails;
  }
}
