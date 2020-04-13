import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String address ="http://owlbridge.in/mobile/";

// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class Secondwebview extends StatefulWidget {
  @override
  _Secondwebview createState() => _Secondwebview();
}


class _Secondwebview extends State<Secondwebview>{
   @override
   Widget build(BuildContext context){
      return SafeArea(
      top: true,
      child:  WebviewScaffold(url: address,
        clearCache: true,),
      // appBar:AppBar( ),
    );
   }
}