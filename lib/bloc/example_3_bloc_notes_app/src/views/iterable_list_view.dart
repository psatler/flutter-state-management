import 'package:flutter/material.dart';

extension ToListView<T> on Iterable<T> {
  Widget toListView() => IterableListView(iterable: this);
}

class IterableListView<T> extends StatelessWidget {
  const IterableListView({
    super.key,
    required this.iterable,
  });

  final Iterable<T> iterable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: iterable.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              iterable.elementAt(index).toString(),
            ),
          );
        },
      ),
    );
  }
}
