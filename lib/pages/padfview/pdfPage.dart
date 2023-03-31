import 'package:flutter/material.dart';

class PdfViewPage extends StatefulWidget {
  const PdfViewPage({super.key, required this.title});
  final String title;
  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf VIewer"),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
