// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_time_app/Widgets/add_time_card.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  List<String> mneu = [
    "Africa/Algiers",
    "Africa/Cairo",
    "Africa/Casablanca",
    "Africa/Tunis",
    "Africa/Khartoum",
    "America/Chicago",
    "America/Havana",
    "America/Los_Angeles",
    "America/Mexico_City",
    "America/New_York",
    "Asia/Amman",
    "Asia/Baghdad",
    "Asia/Beirut",
    "Asia/Dubai",
    "Asia/Gaza",
    "Asia/Qatar",
    "Asia/Riyadh",
    "Asia/Tokyo",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        foregroundColor: Colors.blue,
        backgroundColor: Color.fromARGB(255, 33, 40, 43),
        shadowColor: Colors.white,

        title: Text(
          "choose country",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
          ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mneu.length,
              itemBuilder: (BuildContext context, int index) {
                return AddTimeCard(
                  name: mneu[index],
                );
              }),
        ),
      ),
    );
  }
}
