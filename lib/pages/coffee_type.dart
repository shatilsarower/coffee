import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeetype;
  final bool isSelected;
  final VoidCallback onTap;
  const CoffeeType({
    super.key,
    required this.coffeetype,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeetype,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white, //using enums
          ),
        ),
      ),
    );
  }
}
