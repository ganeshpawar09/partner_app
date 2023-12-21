import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  _CustomAppDrawerState createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  LocalStorage storage = new LocalStorage('usertoken');

  void _logoutnew() async {
    await storage.clear();
    // Navigator.of(context).pushNamed(LoginScreen().routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Welcome"),
            automaticallyImplyLeading: false,
          ),
          // ListTile(
          //   onTap: () {
          //     // Navigator.of(context).pushNamed(HomeScreens.routeName);
          //   },
          //   leading: Icon(
          //     Icons.home,
          //     color: Colors.blue,
          //   ),
          //   title: Text("Home"),
          // ),
          // /*ListTile(
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushNamed(FalvoritScreens.routeName);
          //   },
          //   leading: Icon(
          //     Icons.favorite,
          //     color: Colors.red,
          //   ),
          //   title: Text("Favorit"),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed(BarcodeScan.routeName);
          //   },
          //   leading: Icon(
          //     Icons.favorite,
          //     color: Colors.red,
          //   ),
          //   title: Text("Barcode Scan"),
          // ),*/
          // ListTile(
          //   leading: ImageIcon(
          //     AssetImage("assets/upcoming_order.png"),
          //     color: Colors.blue,
          //   ),
          //   onTap: () {
          //     // Navigator.of(context)
          //     //     .pushNamed(PendingOrderProcessScreen.routeName);
          //   },
          //   title: Text("Upcoming Order"),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushNamed(CompletedOrderProcessScreen.routeName);
          //   },
          //   leading: ImageIcon(
          //     AssetImage("assets/past_order.png"),
          //     color: Colors.blue,
          //   ),
          //   title: Text("Completed Order"),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed(PartnerDashboard.routeName);
          //   },
          //   leading: Icon(
          //     Icons.money,
          //     color: Colors.blue,
          //   ),
          //   title: Text("Order Payments"),
          // ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).pushNamed(RfqPartner.routeName);
          //   },
          //   leading: Icon(
          //     Icons.inventory,
          //     color: Colors.blue,
          //   ),
          //   title: Text("RFQ"),
          // ),
          // Spacer(),
          // ListTile(
          //   onTap: () {
          //     _logoutnew();
          //   },
          //   leading: Icon(
          //     Icons.logout,
          //     color: Colors.green,
          //   ),
          //   title: Text("Logout"),
          // ),
        ],
      ),
    );
  }

  void downloadBinaryFile() {
    HttpClient client = new HttpClient();
    // ignore: deprecated_member_use
    var _downloadData = <int>[];
    var fileSave = new File('./logo.png');
    client
        .getUrl(Uri.parse(
            "https://fluttermaster.com/wp-content/uploads/2018/08/fluttermaster.com-logo-web-header.png"))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.listen((d) => _downloadData.addAll(d), onDone: () {
        fileSave.writeAsBytes(_downloadData);
      });
    });
  }
}
