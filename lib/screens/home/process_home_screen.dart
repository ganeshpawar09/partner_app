import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/process/process_screen.dart';
import 'package:partner_flutter_app/screens/const/font.dart';
import 'package:partner_flutter_app/screens/home/widget/home_grid_view.dart';
import 'package:partner_flutter_app/screens/home/widget/home_screen_body.dart';
import 'package:partner_flutter_app/screens/processrfq/rfq_partner_price.dart';
import 'package:partner_flutter_app/screens/processrfq/rfq_screen.dart';
import 'package:partner_flutter_app/screens/vendor/process_vendor_profile.dart';
import 'package:partner_flutter_app/widgets/drawer.dart';

class ProcessDataFetchStatus {
  static bool processDataIsFetched = false;
  static bool rfqProcessDataIsFetched = false;
}

class ProcessHomeScreen extends StatelessWidget {
  const ProcessHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
        title: "Profile",
        img: "assets/man.png",
        widget: ProcessVendorScreen(),
      ),
      GridItem(
        title: "View Process",
        img: "assets/list.png",
        widget: ProcessScreen(),
      ),
      GridItem(
        title: "View RFQ",
        img: "assets/bid.png",
        widget: RFQScreen(),
      ),
      GridItem(
        title: "Payment",
        img: "assets/wallet.png",
        widget: ProcessScreen(),
      ),
    ];

    return HomeScreenBody(
      list: items,
      title: "Process",
    );
  }
}
