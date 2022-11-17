import 'package:flutter/material.dart';

class TodoWidgetBuilder extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final void Function(bool) onTap;

  const TodoWidgetBuilder(
      {required this.title,
      this.isFavorite = false,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(isFavorite),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              color: isFavorite ? Colors.grey : null,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
