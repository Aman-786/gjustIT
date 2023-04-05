import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:gjustit3/common/color.dart';
import 'package:gjustit3/model/quotesmodel.dart';
import '../../common/textHeadingMain.dart';
import '../../listview/card.dart';
import '../../model/jsonmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var qindex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: const Text(
          "this is title",
          style: TextStyle(color: AppColor.black, fontFamily: "product"),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            //-------------quotes declare-----------
            var quotes = snapshot.data as List<Qmodel>;
            qindex = Random().nextInt(quotes.length);
            //----------------------------------
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Good Morning ,",
                      style: TextStyle(fontSize: 30, fontFamily: "product"),
                    ),
                    const SizedBox(height: 10),
                    //------------quotes-----------------
                    Text(
                      quotes[qindex].q.toString(),
                      style:
                          const TextStyle(fontSize: 20, fontFamily: "product"),
                    ),
                    const SizedBox(height: 5),
                    //---------author--------------
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topRight,
                      child: Text(
                        "by : ${quotes[qindex].a.toString()}",
                        style: const TextStyle(
                            fontSize: 15, fontFamily: "product"),
                      ),
                    ),
                    //---------listview section starts here----------
                    const SizedBox(height: 20),
                    //microprocessor section start here
                    const HeadingMain(text: "Microprocessors and Interfacing"),
                    MainCard(readData: readJsonDataMP),
                    //
                    //=========DATABASE MANAGEMENT SYSTEM starts here============
                    const SizedBox(height: 20),
                    //============DBMS section start here
                    const HeadingMain(text: "Database Management System"),
                    MainCard(readData: readJsonDataDBMS),
                    //
                    const SizedBox(height: 20),
                    //========Analysis and Design of Algorithms
                    const HeadingMain(
                        text: "Analysis and Design of Algorithms"),
                    MainCard(readData: readJsonDataADA),
                    //
                    const SizedBox(height: 20),
                    //========JAVA Section starts here======
                    const HeadingMain(text: "Java Programming"),
                    MainCard(readData: readJsonDataJAVA),
                    //
                    const SizedBox(height: 20),
                    //========Operating System Section starts here======
                    const HeadingMain(text: "Operating System"),
                    MainCard(readData: readJsonDataOS),
                    //
                    const SizedBox(height: 20),
                    //========Software Engineering Section starts here======
                    const HeadingMain(text: "Software Engineering"),
                    MainCard(readData: readJsonDataSE),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Qmodel>> readJsonData() async {
    final jsondata =
        await services.rootBundle.loadString('asstes/json/quotes.json');
    final qlist = json.decode(jsondata) as List<dynamic>;
    return qlist.map((e) => Qmodel.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataMP() async {
    final jsondataMP =
        await services.rootBundle.loadString('asstes/json/mp.json');
    final mplist = json.decode(jsondataMP) as List<dynamic>;
    return mplist.map((e) => Video.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataDBMS() async {
    final jsondataDBMS =
        await services.rootBundle.loadString('asstes/json/dbms.json');
    final dbmslist = json.decode(jsondataDBMS) as List<dynamic>;
    return dbmslist.map((e) => Video.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataADA() async {
    final jsondataADA =
        await services.rootBundle.loadString('asstes/json/ada.json');
    final adalist = json.decode(jsondataADA) as List<dynamic>;
    return adalist.map((e) => Video.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataJAVA() async {
    final jsondataJAVA =
        await services.rootBundle.loadString('asstes/json/java.json');
    final javalist = json.decode(jsondataJAVA) as List<dynamic>;
    return javalist.map((e) => Video.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataOS() async {
    final jsondataOS =
        await services.rootBundle.loadString('asstes/json/os.json');
    final oslist = json.decode(jsondataOS) as List<dynamic>;
    return oslist.map((e) => Video.jsondata(e)).toList();
  }

  Future<List<Video>> readJsonDataSE() async {
    final jsondataSE =
        await services.rootBundle.loadString('asstes/json/se.json');
    final selist = json.decode(jsondataSE) as List<dynamic>;
    return selist.map((e) => Video.jsondata(e)).toList();
  }
}
