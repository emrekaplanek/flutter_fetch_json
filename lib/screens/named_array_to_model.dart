import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_fetch_example/models/eartquake.dart';
import 'package:json_fetch_example/services/request_service.dart';

class NamedArrayToModel extends StatefulWidget {
  const NamedArrayToModel({Key? key}) : super(key: key);

  @override
  State<NamedArrayToModel> createState() => _NamedArrayToModelState();
}

class _NamedArrayToModelState extends State<NamedArrayToModel> {
  String rawData = "";
  List<Eartquake> eartquakeList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Named Json Array to Data",
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
                                context, "assets/eartquakeNamedArray.json")
                            .then((value) {
                          rawData = value;
                          // var data = json.decode(value); // CLEAR way
                          // for (var item in data["eartquake"]) {
                          //   eartquakeList.add(Eartquake.fromMap(item));
                          // }

                          // // BEST way
                          // var data = json.decode(value);
                          // eartquakeList = (data["eartquake"] as List)
                          //     .map((datam) => Eartquake.fromMap(datam))
                          //     .toList();

                          //SHORTEST way
                          eartquakeList =
                              (json.decode(value)["eartquake"] as List)
                                  .map((item) => Eartquake.fromMap(item))
                                  .toList();

                          debugPrint("--List-----------");
                          for (var i = 0; i < eartquakeList.length; i++) {
                            debugPrint(eartquakeList[i].toString());
                          }
                          debugPrint("--End Of List-----------");

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
              if (eartquakeList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: eartquakeList.length,
                            itemBuilder: (BuildContext c, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(eartquakeList[index].toString()),
                              );
                            }),
                      ),
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
