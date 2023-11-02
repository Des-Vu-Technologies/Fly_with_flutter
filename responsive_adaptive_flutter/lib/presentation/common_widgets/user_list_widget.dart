import 'package:flutter/material.dart';
import 'package:responsive_flutter/presentation/common_widgets/colors.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    super.key,
    required this.itemCount,
    required this.isMobile,
  });

  final int itemCount;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 40),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: blackColor,
                    radius: isMobile ? 35 : 30,
                    child: const Icon(Icons.person, size: 30),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dès Vu ${index + 1}",
                          style: TextStyle(
                            fontSize: isMobile ? 20 : 18,
                            color: blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Lorem Ipsum is simply...",
                          style: TextStyle(
                            fontSize: isMobile ? 15 : 13,
                            color: greyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (index == 0 || index == 2 || index == 7)
                Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 20),
                  child: CircleAvatar(
                    backgroundColor: isMobile ? yellowColor : lightBlueColor,
                    radius: 12,
                    child: Text(
                      index == 0 || index == 7 ? "1" : "3",
                      style: const TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                )
              else
                Container()
            ],
          ),
        );
      },
    );
  }
}
