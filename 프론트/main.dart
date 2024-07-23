import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter InAppWebView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? _webViewController;
  String _url = "https://apple.fre.today/main";
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // 권한이 허용됨
    } else {
      // 권한이 거부됨
      // 권한 거부 시 사용자에게 설명하는 로직 추가 가능
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _webViewController?.reload();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _progress < 1.0
              ? LinearProgressIndicator(value: _progress)
              : SizedBox.shrink(),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(_url)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                  mediaPlaybackRequiresUserGesture: false,
                  javaScriptEnabled: true,
                ),
              ),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  _url = url.toString();
                });
              },
              onLoadStop: (controller, url) async {
                setState(() {
                  _url = url.toString();
                });
              },
              onLoadError: (controller, url, code, message) {
                print('Page load error: $message');
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
              onConsoleMessage: (controller, consoleMessage) {
                print("Console message: ${consoleMessage.message}");
              },
              androidOnGeolocationPermissionsShowPrompt:
                  (controller, origin) async {
                return GeolocationPermissionShowPromptResponse(
                    origin: origin, allow: true, retain: true);
              },
              androidShouldInterceptRequest: (controller, request) async {
                // Intercept file upload requests and handle them
                if (request.url.toString().contains('file://')) {
                  // Handle file request here
                  return WebResourceResponse(
                    contentType: 'application/octet-stream',
                    data: null,
                  );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
