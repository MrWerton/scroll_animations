import 'package:flutter/material.dart';
import 'package:scroll_animations/pages/home_page.dart';
import 'package:scroll_animations/pages/jump_to_top_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/jump-to-top': (context) => JumpToTop()
      },
    );
  }
}
