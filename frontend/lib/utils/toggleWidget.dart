import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ColorUtils.dart';

class AnimatedTwoOptionToggleWidget extends StatefulWidget {
  const AnimatedTwoOptionToggleWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTwoOptionToggleWidgetState createState() =>
      _AnimatedTwoOptionToggleWidgetState();
}

class _AnimatedTwoOptionToggleWidgetState
    extends State<AnimatedTwoOptionToggleWidget> {
  bool _toggle = true;
  bool isPaziente = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggle = !_toggle;
          isPaziente = !isPaziente;
        });
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
                'Paziente',
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
                'Medico',
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
