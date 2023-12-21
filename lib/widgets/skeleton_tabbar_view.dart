import 'package:flutter/material.dart';
import 'package:partner_flutter_app/widgets/skeleton_list_view.dart';

class SkeletonTabbarView extends StatelessWidget {
  const SkeletonTabbarView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SkeletonListView();
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SkeletonListView();
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SkeletonListView();
              }),
        ),
      ],
    );
  }
}
