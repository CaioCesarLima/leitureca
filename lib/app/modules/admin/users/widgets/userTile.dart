import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/routes/app_pages.dart';

Widget UserTile(String username, String userClass) {
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome: $username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Turma: $userClass"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DEPOSIT);
            },
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.attach_money),
            ),
          ),
          SizedBox(
            width: 10,
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
