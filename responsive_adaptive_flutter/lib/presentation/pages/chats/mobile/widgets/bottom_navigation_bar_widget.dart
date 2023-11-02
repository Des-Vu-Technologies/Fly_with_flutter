import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/common_widgets/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      onTap: (index) {},
      unselectedItemColor: greyColor,
      selectedItemColor: blackColor,
      items: const [
        BottomNavigationBarItem(
          label: "",
          icon: Icon(CupertinoIcons.home, size: 31),
          activeIcon: Icon(CupertinoIcons.home, size: 31),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(CupertinoIcons.chat_bubble, size: 30),
          activeIcon: Icon(CupertinoIcons.chat_bubble, size: 30),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(CupertinoIcons.folder, size: 29),
          activeIcon: Icon(CupertinoIcons.folder, size: 29),
        ),
        BottomNavigationBarItem(
          label: "",
          icon: Icon(CupertinoIcons.person, size: 29),
          activeIcon: Icon(CupertinoIcons.person, size: 29),
        ),
      ],
    );
  }
}
