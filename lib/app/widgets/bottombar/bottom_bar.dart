import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/widgets/bottombar/bottom_bar_controller.dart';

class BottomNavigationbar extends StatelessWidget {
  const BottomNavigationbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomBarController(),
        builder: (_) {
          return BottomNavigationBar(
            onTap: (val) {
              _.setCurrentIndex(val);
            },
            currentIndex: _.currentIndex,
            selectedItemColor: Colors.purple[900],
            unselectedItemColor: Colors.purple[200],
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                ),
                label: "Saldo",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: "Loja",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: "Compras",
              ),
            ],
          );
        });
  }
}
