import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import '../../common/color.dart';

class PdfScreen2 extends StatefulWidget {
  const PdfScreen2({super.key, this.title, this.url});
  final String? title;
  final String? url;
  @override
  State<PdfScreen2> createState() => _PdfScreen2State();
}

class _PdfScreen2State extends State<PdfScreen2> {
  late Future<Uint8List?> _data;
  late PdfController pdfController;
  @override
  void initState() {
    _data = InternetFile.get(widget.url.toString());
    pdfController = PdfController(
        document: PdfDocument.openData(_data as FutureOr<Uint8List>));
    super.initState();
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          // width: 200,
          child: Text(
            widget.title.toString(),
            style: const TextStyle(color: AppColor.white),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return PdfView(
              physics: const BouncingScrollPhysics(),
              backgroundDecoration:
                  const BoxDecoration(color: AppColor.backgroundColor),
              controller: pdfController,
              scrollDirection: Axis.horizontal,
              onDocumentLoaded: (document) => Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(child: CircularProgressIndicator())),
              onDocumentError: (error) => Text(error.toString()),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
