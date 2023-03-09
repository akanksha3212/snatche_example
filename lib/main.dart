import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewApp(),
    ),
  );
}



class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key, }) : super(key: key);


  @override
  WebViewAppState createState() => WebViewAppState();
}

class WebViewAppState extends State<WebViewApp> {
  @override
  void initState() {
    super.initState();

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  @override
  int pos = 1;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(title:SizedBox(),backgroundColor: Colors.white,elevation: 0,),
        body: IndexedStack(index: pos, children: <Widget>[
          WebView(
            initialUrl:
           'http://www.snatche.technosoftwares.com/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {},
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
            onPageStarted: (value) {
              setState(() {
                pos = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                pos = 0;
              });
            },
            gestureNavigationEnabled: true,
            backgroundColor: Colors.white,
          ),
          Container(
            color: Colors.white,
            child: Center(child: Center(child:CircularProgressIndicator())),
          ),
        ]));
  }
}
