import 'package:flutter/material.dart';

Widget SearchWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Container(
      child: Row(
        children: [
          Expanded(child: TextFormField()),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    ),
  );
}
