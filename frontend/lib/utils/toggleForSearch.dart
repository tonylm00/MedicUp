import 'dart:developer';

import 'package:flutter/material.dart';

import 'ColorUtils.dart';

class AnimatedSearchToggleWidget extends StatefulWidget {
  const AnimatedSearchToggleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedSearchToggleWidgetState createState() =>
      _AnimatedSearchToggleWidgetState();
}

class _AnimatedSearchToggleWidgetState
    extends State<AnimatedSearchToggleWidget> {
  bool _toggle = true;
  bool searchByName = true;
  bool searchByPrincipio = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggle = !_toggle;
          searchByName = !searchByName;
          searchByPrincipio = !searchByPrincipio;
        });
        log('$searchByName + $searchByPrincipio');
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: _toggle
                    ? ColorUtils.gradientStart
                    : ColorUtils.lightPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: Text(
                'Nome',
                style: TextStyle(
                  color: _toggle ? Colors.white : Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: _toggle
                    ? ColorUtils.lightPrimary
                    : ColorUtils.gradientStart,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                'Principio Attivo',
                style: TextStyle(
                  color: _toggle ? Colors.black : Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
