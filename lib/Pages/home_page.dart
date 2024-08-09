// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_element, non_constant_identifier_names, duplicate_import

import 'package:flutter/material.dart';
import 'package:world_time_app/Widgets/time_card.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/models/time.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Time> allTime = [];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      appBar: AppBar(
        elevation: 0.3,
        shadowColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 33, 40, 43),
        title: Text(
          "World Time",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: IconButton(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/add');
                if (result == null) {
                } else {
                  setState(() {
                    allTime.add(Time(result["country"], result["time"]));
                  });
                }
              },
              icon: Icon(
                Icons.add,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: IconButton(
              onPressed: () {
                setState(() {
                  allTime.removeRange(0, allTime.length);
                });
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: (allTime.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "There are no times yet",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To add, click",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 30,
                      )
                    ],
                  ),
                ],
              ),
            )
          : SafeArea(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: allTime.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TimeCard(
                      name: allTime[index].name,
                      time: allTime[index].time,
                    );
                  }),
            ),
    );
  }
}
