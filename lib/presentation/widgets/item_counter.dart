import 'package:flutter/material.dart';

class ItemCounter extends StatelessWidget {
  const ItemCounter({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: counter > 0
              ? () {
                  onDecrement();
                }
              : null,
          icon: const Icon(Icons.remove_circle),
        ),
        Text(
          counter.toString(),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            onIncrement();
          },
          icon: const Icon(Icons.add_circle),
        ),
      ],
    );
  }
}
