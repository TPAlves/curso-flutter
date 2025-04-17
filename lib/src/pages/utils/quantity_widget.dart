import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String unitMeasureText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityWidget({
    super.key,
    required this.value,
    required this.unitMeasureText,
    required this.result,
    this.isRemovable = false,
  });

  @override
  Widget build(BuildContext context) {
    bool validateButtonQuantity = !isRemovable || value > 1;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: validateButtonQuantity ? Icons.remove : Icons.delete_forever,
            color: validateButtonQuantity ? Colors.grey : Colors.redAccent,
            onPressed: () {
              if (value == 1 && !isRemovable) return;
              int resultCount = value == 0 ? value : value - 1;
              result(resultCount);
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$value $unitMeasureText',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),

          _QuantityButton(
            icon: Icons.add,
            color: Colors.green,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  const _QuantityButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
      ),
    );
  }
}
