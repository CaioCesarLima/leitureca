import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leitureca/app/modules/admin/widgets/bottombar/bottom_bar_controller.dart';

class AdminBottomNavigationbar extends StatelessWidget {
  const AdminBottomNavigationbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AdminBottomBarController(),
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
                  Icons.people,
                ),
                label: "Usuários",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "Produtos",
                backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on_outlined),
                label: "Depósitos",
                backgroundColor: Colors.red,
              ),
            ],
          );
        });
  }
}
