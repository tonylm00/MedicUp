import 'package:flutter/material.dart';
import 'package:frontend/utils/ColorUtils.dart';

class MyDropdownButton extends StatefulWidget {
  final String title;
  final Widget content;

  MyDropdownButton({required this.title, required this.content});

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            );
          },
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: widget.content),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
