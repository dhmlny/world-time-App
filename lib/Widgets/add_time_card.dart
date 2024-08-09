// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations, use_build_context_synchronously, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AddTimeCard extends StatefulWidget {
  final String name;
  AddTimeCard({super.key, required this.name});

  @override
  State<AddTimeCard> createState() => _AddTimeCardState();
}

var receivedData;

String editName(String x) {
  int i = x.indexOf('/');
  return x.substring(i + 1, x.length);
}

String editTime(String datetime, String offset) {
  DateTime realTime = DateTime.parse(datetime);
  String soffset = offset.substring(0, 3);
  int numoffset = int.parse(soffset);

  DateTime result = realTime.add(Duration(hours: numoffset));
  return DateFormat('h:mm a').format(result);
}

class _AddTimeCardState extends State<AddTimeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    try {
                      Response response = await get(Uri.parse(
                          "http://worldtimeapi.org/api/timezone/${widget.name}"));
                      setState(() {
                        receivedData = jsonDecode(response.body);
                      });
                    } catch (e) {
                      print(e);
                    }
                    Navigator.pop(context, {
                      "country": "${editName(widget.name)}",
                      "time": "${editTime(receivedData["utc_datetime"],receivedData["utc_offset"])}",
                    });
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 25,
                  ),
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
