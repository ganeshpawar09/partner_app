import 'package:flutter/material.dart';
import 'package:partner_flutter_app/models/combine_model.dart';
import 'package:partner_flutter_app/screens/const/font.dart';

class HomeScreenGridView extends StatelessWidget {
  final GridItem item;
  const HomeScreenGridView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.widget),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(item.title,
                    textAlign: TextAlign.center,
                    style: AppStyles.mondaN.copyWith(fontSize: 17)),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  item.img,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
