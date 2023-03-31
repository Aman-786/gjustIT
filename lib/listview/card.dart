import 'package:flutter/material.dart';

import '../model/jsonmodel.dart';
import '../pages/padfview/pdfPage.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.readData});
  final Function readData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var dbmsList = snapshot.data as List<Video>;
            return SizedBox(
              height: 200,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: dbmsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PdfViewPage(
                              title: dbmsList[index].url.toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        width: 140,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image(
                                  fit: BoxFit.contain,
                                  height: 100,
                                  image: NetworkImage(
                                    dbmsList[index].img.toString(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                dbmsList[index].title.toString(),
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "product",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
