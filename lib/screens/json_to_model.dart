import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_fetch_example/models/eartquake.dart';
import 'package:json_fetch_example/services/request_service.dart';

class JsonToModel extends StatefulWidget {
  const JsonToModel({Key? key}) : super(key: key);

  @override
  State<JsonToModel> createState() => _JsonToModelState();
}

class _JsonToModelState extends State<JsonToModel> {
  String rawData = "";
  Eartquake? eartquake;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Json to Data",
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        RequestService.getJson(context, "assets/eartquake.json")
                            .then((value) {
                          rawData = value;

                          // var data = json.decode(value); // CLEAR way
                          // eartquake = Eartquake.fromMap(data);

                          eartquake = Eartquake.fromJson(
                              value); // BEST and SHORTEST way

                          debugPrint("--Model-----------");
                          debugPrint(eartquake.toString());
                          debugPrint("--End Of Model-----------");

                          setState(() {});
                        });
                      },
                      child: const Text("Fetch Data")),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Raw Json Data",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(rawData.toString()),
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Data From Model",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(child: Text(eartquake.toString())),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
