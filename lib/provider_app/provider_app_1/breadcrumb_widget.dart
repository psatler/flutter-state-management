import 'dart:collection';

import 'package:flutter/material.dart';

import 'breadcrumb.dart';

typedef OnBreadCrumbTapped = void Function(Breadcrumb);

class BreadCrumbsWidget extends StatelessWidget {
  const BreadCrumbsWidget({
    Key? key,
    required this.breadCrumbs,
    required this.onTapped,
  }) : super(key: key);

  final UnmodifiableListView<Breadcrumb> breadCrumbs;
  final OnBreadCrumbTapped onTapped;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map((breadCrumb) {
        return GestureDetector(
          onTap: () {
            onTapped(breadCrumb);
          },
          child: Text(
            breadCrumb.title,
            style: TextStyle(
              color: breadCrumb.isActive ? Colors.blue : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }
}
