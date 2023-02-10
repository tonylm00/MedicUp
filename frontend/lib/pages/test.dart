import 'package:flutter/material.dart';

class SignUpPageTest extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPageTest> {
  int _currentIndex = 0;

  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Page 1'),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Page 2'),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text('Page 3'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _currentIndex > 0
                        ? () => _controller.animateToPage(_currentIndex - 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease)
                        : null,
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _currentIndex < 2
                        ? () => _controller.animateToPage(_currentIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

