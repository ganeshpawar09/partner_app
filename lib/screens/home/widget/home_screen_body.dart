import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/const/font.dart';
import 'package:partner_flutter_app/screens/home/widget/home_grid_view.dart';
import 'package:partner_flutter_app/widgets/drawer.dart';

class HomeScreenBody extends StatelessWidget {
  final List<GridItem> list;
  final String? title;
  const HomeScreenBody({Key? key,required this.list, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          "${(title!=null)?title:""} Dashboard",
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
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) =>
                    HomeScreenGridView(item: list[index]),
              ),
            ),
          ),
        ],
      ),
      drawer: CustomAppDrawer(),
    );
  }
  }