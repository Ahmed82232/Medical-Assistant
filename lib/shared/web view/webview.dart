// ignore_for_file: must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../generated/l10n.dart';
import '../../modules/settings/cubit.dart';
import '../style/colors.dart';

class WebViewsNews extends StatelessWidget {
  WebViewsNews(this.url, {super.key});
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:SettingCubit.get(context).isDark
                    ? appBarDarkColor
                    : Theme.of(context).bottomAppBarColor,
        // leading: back(context),
        title: Text(
          S.of(context).titleWebView,
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
