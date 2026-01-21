import 'package:flutter/material.dart';

class DataListItem extends StatelessWidget {
  final String label;
  final String value1;
  final String value2;
  final String? iconPath;
  final bool isEven;

  const DataListItem({
    super.key,
    required this.label,
    required this.value1,
    required this.value2,
    this.iconPath,
    this.isEven = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEven ? const Color(0xFFF5F7FA) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          if (iconPath != null) ...[
            Image.asset(iconPath!, height: 20, width: 20),
            const SizedBox(width: 8),
          ],
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value1,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value2,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
