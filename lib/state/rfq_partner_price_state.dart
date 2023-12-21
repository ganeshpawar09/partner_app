import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/server_url.dart';

class RfqPartnerPriceState with ChangeNotifier {
  LocalStorage storage =  LocalStorage('usertoken');
  late RfqPartnerPrice _rfqPartnerPrice;
  late List<RfqPartnerPrice> _rfqpartnerprice;

  Future<void> getRFQDatas() async {
    String url = serversite + '/api/rfq_vendor_list/';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      List<RfqPartnerPrice> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          RfqPartnerPrice rfqpartnerprice = RfqPartnerPrice.fromJson(element);

          demo.add(rfqpartnerprice);
        });
        _rfqPartnerPrice = demo[0];
        notifyListeners();
      } else {
        print("something went wrong from server side error=True");
      }
    } catch (e) {
      print("error get RFQ Data");
    }
  }

  Future<void> getRFQlists() async {
    String url = serversite + '/api/rfq_vendor_list/';
    var token = storage.getItem('token');
    //print('test2');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      List<RfqPartnerPrice> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          RfqPartnerPrice rfqpartnerpricelist =
              RfqPartnerPrice.fromJson(element);
          demo.add(rfqpartnerpricelist);
        });
        print('process data');
        _rfqpartnerprice = demo;
        notifyListeners();
      } else {
        print("something went wrong from server side error=True");
      }
    } catch (e) {
      print("error get rfq list");
      print(e);
    }
  }

  Future<http.Response?> updaterfqpartner(int id, int val1) async {
    String url_get = serversite + '/api/rfq_vendor/$id/';

    String url = serversite + '/api/update_partner_rfq_price/$id/';
    var token = storage.getItem('token');

    try {
      http.Response response_get = await http.get(Uri.parse(url_get), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response_get.body);
      data['data'][0]['rfq_cost'] = val1;
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(data['data'][0]),
          headers: {
            "Content-Type": "application/json",
            'Authorization': "token $token"
          });
      // var data = json.decode(response.body);
      // print(data);
      //getRFQlists();
      return response;
    } catch (e) {
      print("e updaterfqpartner");
    }
  }

  RfqPartnerPrice? get rfqPartner {
    if (_rfqPartnerPrice != null) {
      return _rfqPartnerPrice;
    } else {
      return null;
    }
  }

  List<RfqPartnerPrice> get rfqpartnerlist {
    return _rfqpartnerprice;
  }

  RfqPartnerPrice singlerfqitem(int id) {
    print('id');
    print(id);
    return _rfqpartnerprice.firstWhere((element) => element.id == id);
  }
}
//try 2

