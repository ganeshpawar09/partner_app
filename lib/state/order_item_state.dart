import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/server_url.dart';

class OrderItemState extends ChangeNotifier {
  LocalStorage storage = LocalStorage('usertoken');

  ErpOrderItem? _singleerporderitem;

  Future<void> getErpOrderItemByProcess(OrderProcess orderProcess) async {
    String url =
        '$serversite/api/erp-orderitem-by-processid/${orderProcess.processId}';
    var token = storage.getItem('token');
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      List<ErpOrderItem> demo = [];
      if (data['error'] == false) {
        data['data'].forEach((element) {
          ErpOrderItem erporderitemlist = ErpOrderItem.fromJson(element);
          demo.add(erporderitemlist);
        });
        print('success erporderitemlist data');
        _singleerporderitem = demo[0];
        notifyListeners();
      } else {
        print("something went wrong from server side error=True");
      }
    } catch (e) {
      print(e);
      print("error erporderitemlist");
    }
  }

  ErpOrderItem? get erpOrderItemByProcess {
    return _singleerporderitem;
  }
}
