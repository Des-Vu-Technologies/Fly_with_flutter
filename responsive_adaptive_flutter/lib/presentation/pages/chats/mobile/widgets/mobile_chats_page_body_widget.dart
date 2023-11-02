import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/common_widgets/colors.dart';
import 'package:responsive_flutter/presentation/common_widgets/search_field.dart';
import 'package:responsive_flutter/presentation/common_widgets/user_list_widget.dart';

class MobileChatsPageBody extends StatelessWidget {
  const MobileChatsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Clients",
              style: TextStyle(
                fontSize: 33,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            SearchField(),
            SizedBox(height: 10),
            UserListWidget(
              itemCount: 5,
              isMobile: true,
            ),
            Text(
              "Colleagues",
              style: TextStyle(
                fontSize: 33,
                color: blackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            UserListWidget(
              itemCount: 5,
              isMobile: true,
            )
          ],
        ),
      ),
    );
  }
}
