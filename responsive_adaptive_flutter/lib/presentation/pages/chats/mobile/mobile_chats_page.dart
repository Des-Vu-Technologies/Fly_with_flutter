import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/common_widgets/colors.dart';
import 'package:responsive_flutter/presentation/pages/chats/mobile/widgets/bottom_navigation_bar_widget.dart';
import 'package:responsive_flutter/presentation/pages/chats/mobile/widgets/mobile_chats_page_body_widget.dart';

class MobileChatsPage extends StatelessWidget {
  const MobileChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarWidget(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontSize: 27,
            color: blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 40,
                color: blackColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const MobileChatsPageBody(),
    );
  }
}
