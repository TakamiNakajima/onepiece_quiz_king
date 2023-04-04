import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  final String label;
  final Color color;

  ButtonWithIcon({required this.onPressed, required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon,
          label: Text(label, style: TextStyle(fontSize: 20)),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
          ),
        ),
      ),
    );
  }
}
