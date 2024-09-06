import 'package:cffp_web/games_page/data/games_page_model.dart';
import 'package:flutter/material.dart';

class WeekPicksList extends StatefulWidget {
  const WeekPicksList({super.key});

  @override
  State<WeekPicksList> createState() => _WeekPicksListState();
}

class _WeekPicksListState extends State<WeekPicksList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      width: 400.0,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Text("Banana");
        },
      ),
    );
  }
}
