import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ProductTile(String bookTitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(
          color: Colors.deepPurple,
        )),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image(
                image: NetworkImage(
                    'https://images-na.ssl-images-amazon.com/images/I/612QiXA+FyL.jpg')),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.edit),
          )
        ],
      ),
    ),
  );
}
