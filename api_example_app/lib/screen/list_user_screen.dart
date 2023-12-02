import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../http_service.dart';
import '../model/list_user.dart';

class ListUserScreen extends StatefulWidget {
  const ListUserScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  bool isLoading = false;

  late HttpService http;

  late ListUser listUserResponse;

  late List<Data> users;

  Future getListUser() async {
    Response response;
    try {
      isLoading = true;

      response = await http.getRequest("/api/users?page=2");

      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUser.fromJson(response.data);
          users = listUserResponse.data!;
        });
      } else {
        log("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      log(e.toString());
    }
  }

  @override
  void initState() {
    http = HttpService();

    getListUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get Single user"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  final user = users[index];

                  return ListTile(
                    title: Text(user.firstName!),
                    leading: Image.network(user.avatar!),
                    subtitle: Text(user.email!),
                  );
                },
                itemCount: users.length,
              ));
  }
}
