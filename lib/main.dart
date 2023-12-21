import 'package:flutter/material.dart';
import 'package:partner_flutter_app/screens/home/home_screen.dart';
import 'package:partner_flutter_app/screens/login/login_screen.dart';
import 'package:partner_flutter_app/screens/spalsh/spalsh_screen.dart';
import 'package:partner_flutter_app/state/order_item_state.dart';
import 'package:partner_flutter_app/state/partner_details_state.dart';
import 'package:partner_flutter_app/state/process_state.dart';
import 'package:partner_flutter_app/state/rfq_partner_price_state.dart';
import 'package:partner_flutter_app/state/user_state.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => ProcessState()),
        ChangeNotifierProvider(create: (ctx) => OrderItemState()),
        ChangeNotifierProvider(create: (ctx) => RfqPartnerPriceState()),
        ChangeNotifierProvider(create: (ctx) => PartnerState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          primaryColorLight: Colors.white,
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 254, 1),
        ),
        home: SplashScreen(),
        // home: FutureBuilder(
        //   future: storage.ready,
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.data == null) {
        //       return Scaffold(
        //         body: Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       );
        //     }
        //     if (storage.getItem('token') == null) {
        //       return LoginScreen();
        //     }
        //     return HomeScreen();
        //   },
        // ),
      ),
    );
  }
}
