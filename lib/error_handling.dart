import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';





class errorhelp extends StatefulWidget {
  @override
  _errorhelp createState() => _errorhelp();
}


class _errorhelp extends State<errorhelp>{
  WebViewController _controller;


   @override
   Widget build(BuildContext context){
      return Scaffold(
      appBar:  AppBar(title: Text('Prathibha'),),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
   }

   _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/error.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}