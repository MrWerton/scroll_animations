import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  bool _showFloatButton = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  _handleScroll() {
    final size = MediaQuery.of(context).size;
    if (_scrollController.position.pixels >=
        _scrollController.position.minScrollExtent + size.height / 2) {
      setState(() {
        _showFloatButton = true;
      });
    } else {
      setState(() {
        _showFloatButton = false;
      });
    }
  }

  _navigateToTop() {
    _scrollController.animateTo(0.0,
        curve: Curves.bounceInOut, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        itemCount: 16,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            width: size.width,
            height: size.height * 0.25,
          );
        },
      ),
      floatingActionButton: _showFloatButton
          ? FloatingActionButton(onPressed: _navigateToTop)
          : null,
    );
  }
}
