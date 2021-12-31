import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => WebPage())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "利用規約",
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
              )
            ],
          )),
    );
  }
}

class WebPage extends StatelessWidget {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("利用規約"),
      ),
      body: WebView(
        initialUrl:
            'https://akitonanndaze.wixsite.com/website-1/%E5%88%A9%E7%94%A8%E8%A6%8F%E7%B4%84',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
