import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/const/font.dart';
import 'package:partner_flutter_app/screens/home/widget/home_grid_view.dart';
import 'package:partner_flutter_app/screens/process/process_screen.dart';
import 'package:partner_flutter_app/screens/rfq/rfq_partner_price.dart';
import 'package:partner_flutter_app/widgets/drawer.dart';

class DataFetchStatus {
  static bool orderDataIsFetched = false;
  static bool processDataIsFetched = false;
  static bool orderItemDataIsFetched = false;
  static bool movementDataIsFetched = false;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
        title: "Profile",
        img: "assets/man.png",
        widget: ProcessScreen(),
      ),
      GridItem(
        title: "View Process",
        img: "assets/list.png",
        widget: ProcessScreen(),
      ),
      GridItem(
        title: "View RFQ",
        img: "assets/bid.png",
        widget: RfqPartner(),
      ),
      GridItem(
        title: "Payment",
        img: "assets/wallet.png",
        widget: ProcessScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset(
                "assets/menu.png",
                width: 35,
                height: 35,
              ),
            );
          },
        ),
        title: Text(
          "Dashboard",
          style: AppStyles.mondaB.copyWith(fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) =>
                    HomeScreenGridView(item: items[index]),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomAppDrawer(),
    );
  }
}
