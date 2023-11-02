import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/common_widgets/colors.dart';
import 'package:responsive_flutter/presentation/common_widgets/search_field.dart';
import 'package:responsive_flutter/presentation/common_widgets/user_list_widget.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Clients",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            width: size.width / 2.3,
            child: const SearchField(),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            height: size.height - 136,
            width: size.width / 2.3,
            child: const UserListWidget(
              itemCount: 15,
              isMobile: false,
            ),
          ),
        ],
      ),
    );
  }
}
