import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_fetch_example/models/eartquakeCity.dart';
import 'package:json_fetch_example/services/request_service.dart';

class JsonToModelNested extends StatefulWidget {
  const JsonToModelNested({Key? key}) : super(key: key);

  @override
  State<JsonToModelNested> createState() => _JsonToModelNestedState();
}

class _JsonToModelNestedState extends State<JsonToModelNested> {
  String rawData = "";
  EartquakeCity? eartquakeCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Nested Json to Data",
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
                        RequestService.getJson(
                                context, "assets/eartquakeNested.json")
                            .then((value) {
                          rawData = value;

                          // var data = json.decode(value); // CLEAR way
                          // eartquakeCity = EartquakeCity.fromMap(data);

                          eartquakeCity = EartquakeCity.fromJson(
                              value); // BEST and SHORTEST way

                          debugPrint("--Model-----------");
                          debugPrint(eartquakeCity.toString());
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
                    SizedBox(child: Text(eartquakeCity.toString())),
                  ],
                ),
              ),
              if (eartquakeCity != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(child: Text(eartquakeCity!.city.toString())),
                      SizedBox(child: Text(eartquakeCity!.city.name)),
                      SizedBox(child: Text(eartquakeCity!.city.code)),
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
