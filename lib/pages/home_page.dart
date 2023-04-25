import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
              height: 50,
              width: double.infinity,
              child: _button(
                  context: context,
                  path: '/jump-to-top',
                  title: 'Jump to top')),
        ],
      ),
    ));
  }

  Widget _button(
      {required BuildContext context,
      required String path,
      required String title}) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () => Navigator.of(context).pushNamed(path),
    );
  }
}
