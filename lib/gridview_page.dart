import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // GridView(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     childAspectRatio: 1.0,
        //   ),
        //   children: [
        //     Icon(Icons.ac_unit),
        //     Icon(Icons.airport_shuttle),
        //     Icon(Icons.all_inclusive),
        //     Icon(Icons.beach_access),
        //     Icon(Icons.cake),
        //     Icon(Icons.free_breakfast),
        //   ],
        // );
        //     GridView.count(
        //   crossAxisCount: 3,
        //   childAspectRatio: 1.0,
        //   children: [
        //     Icon(Icons.ac_unit),
        //     Icon(Icons.airport_shuttle),
        //     Icon(Icons.all_inclusive),
        //     Icon(Icons.beach_access),
        //     Icon(Icons.cake),
        //     Icon(Icons.free_breakfast),
        //   ],
        // );
        GridView(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0, childAspectRatio: 2.0),
      children: [
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}
