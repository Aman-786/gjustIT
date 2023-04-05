import 'package:flutter/material.dart';
import 'package:gjustit3/common/color.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfScreen extends StatefulWidget {
  final String? title;
  final String? url;
  const PdfScreen({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfController pdfController;
  var url =
      'https://drive.google.com/uc?export=download&id=1j1kOxVz0V0EaMpCf6xgVB2QAz_rTiYif';
  loadcontroller() async {
    pdfController = PdfController(
        document:
            PdfDocument.openData(InternetFile.get(widget.url.toString())));
  }

  @override
  void initState() {
    loadcontroller();
    super.initState();
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
      body: Center(
        child: Visibility(
          visible: false,
          child: PdfView(
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
          ),
        ),
      ),
    );
  }
}
