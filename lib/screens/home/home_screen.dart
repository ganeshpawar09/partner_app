import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/home/Process_home_screen.dart';
import 'package:partner_flutter_app/screens/home/material_home_screen.dart';
import 'package:partner_flutter_app/screens/home/widget/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
        title: "Process Vendor",
        img: "assets/list.png",
        widget: ProcessHomeScreen(),
      ),
      GridItem(
        title: "Material Vendor",
        img: "assets/man.png",
        widget: MaterialHomeScreen(),
      ),
    ];

    return HomeScreenBody(list: items);
  }
}
