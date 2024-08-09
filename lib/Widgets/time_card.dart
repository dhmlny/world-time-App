// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String name;
  final String time;
  TimeCard({
    super.key, required this.name, required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      child: Container(
        color: Color.fromARGB(255, 33, 40, 43),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$name",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "$time",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                            color: Colors.blue,
                            offset: Offset(1.5, 1.5)
                          )
                        ]
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.blue[10],
              height: 20,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
