import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/pages/chats/desktop/widgets/chat_page_widget.dart';
import 'package:responsive_flutter/presentation/pages/chats/desktop/widgets/side_bar.dart';

class DesktopChatsPage extends StatelessWidget {
  const DesktopChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          SideBar(),
          ChatPageWidget(),
        ],
      ),
    );
  }
}
