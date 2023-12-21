import 'dart:convert';
import 'dart:io';

import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:partner_flutter_app/server_url.dart';

class ApiServiceProvider {
  LocalStorage storage = new LocalStorage('usertoken');
  //static final String BASE_URL = "https://www.ibm.com/downloads/cas/GJ5QVQ7X";
  static final String BASE_URL = serversite + "/media/Erp/GST_Certificate.pdf";
  static Future<String> loadPDF(int id, var token) async {
    String url = serversite + '/api/get_pdf_file_rfq/$id/';
    String final_url=serversite;
    print("pdf view");
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization": "token $token",
      });
      var data = json.decode(response.body) as Map;
      if (data['error'] == false) {
        final_url = serversite + data['data'];
      } else {
        print("something went wrong from server side error=True");
      }
    } catch (e) {
      print("error getCartDatas");
    }
    //pdf = getfileloc(id);

    var response = await http.get(Uri.parse(final_url));
    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}
