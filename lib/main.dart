import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       body: SafeArea(
//         child: WebView(
//           initialUrl: "https://smartzonesaudi.com/",
//           javascriptMode: JavascriptMode.unrestricted,
//         ),
//       ),
//     ),
//   ));
// }


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: WebViewContainer(),
        ),
      ),
    );
  }
}


class WebViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://smartzonesaudi.com/',
      javascriptMode: JavascriptMode.unrestricted,
      // navigationDelegate: (NavigationRequest request) {
      //   if (request.url.startsWith('whatsapp://send/?phone=966574381862&text=Welcome%20%to%20')) {
      //     launch(request.url);
      //     return NavigationDecision.prevent;
      //   }
      //   return NavigationDecision.navigate;
      // },

      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('whatsapp://')) {
          // Open in external browser
          launch(request.url);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
      // Other WebView properties...
    );
  }
}






