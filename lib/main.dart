import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:connectivity/connectivity.dart';
import 'package:prathibha/error_handling.dart';
import './webview.dart';


// ignore: prefer_collection_literals
final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

String address ="http://owlbridge.in/mobile/";

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      primarySwatch: Colors.blue
  ),
  home: myhomepage(),
));


class myhomepage extends StatefulWidget{
  @override
  _myhomepagestate createState() => _myhomepagestate();
}


class _myhomepagestate extends State<myhomepage> {

  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          _connectionStatus = result.toString();
             print(_connectionStatus);
            if (result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile) {
             setState(() {
               Secondwebview();
             });
      }else{
             setState(() {
               errorhelp();
             });
      }
    });
  }


   @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return SafeArea(
      top: true,
      child:  WebviewScaffold(
        url: address,
        clearCache: true,),
      // appBar:AppBar( ),
    );
  }

   
}