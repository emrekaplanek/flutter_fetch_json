import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_fetch_example/models/eartquake.dart';
import 'package:json_fetch_example/services/request_service.dart';

class ArrayToModel extends StatefulWidget {
  const ArrayToModel({Key? key}) : super(key: key);

  @override
  State<ArrayToModel> createState() => _ArrayToModelState();
}

class _ArrayToModelState extends State<ArrayToModel> {
  String rawData = "";
  List<Eartquake> eartquakeList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Json Array to Data",
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
                                context, "assets/eartquakeArray.json")
                            .then((value) {
                          rawData = value;

                          // var data = json.decode(value); // STUPID way
                          // for (var item in data) {
                          //   eartquakeList.add(Eartquake.fromJson(json.encode(item)));
                          // }

                          // var data = json.decode(value); // CLEAR way
                          // for (var item in data) {
                          //   eartquakeList.add(Eartquake.fromMap(item));
                          // }

                          // List<dynamic> data = json.decode(value); // BEST way
                          // eartquakeList =
                          //     data.map((datam) => Eartquake.fromMap(datam)).toList();

                          eartquakeList =
                              (json.decode(value) as List) //SHORTEST way
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
