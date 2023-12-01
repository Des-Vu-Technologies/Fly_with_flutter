import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../http_service.dart';
import '../model/user.dart';

class SingleUserScreen extends StatefulWidget {
  const SingleUserScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SingleUserScreenState createState() => _SingleUserScreenState();
}

class _SingleUserScreenState extends State<SingleUserScreen> {
  late HttpService http;

  User? user;

  bool isLoading = false;

  Future getUser() async {
    try {
      isLoading = true;
      Response response = await http.getRequest("/api/users/2");
      isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          user = User.fromJson(
              response.data); // Assuming User.fromJson() method exists
        });
      } else {
        log("Request failed with status code: ${response.statusCode}");
        // Handle other status codes if needed
      }
    } catch (e) {
      isLoading = false;
      log("Error fetching user data: $e");
      // Handle other exceptions if needed
    }
  }

  @override
  void initState() {
    http = HttpService();

    getUser();

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
          // ignore: unnecessary_null_comparison
          : user != null
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(user!.data!.avatar!),
                      Container(
                        height: 16,
                      ),
                      Text(
                          "Hello, ${user!.data!.firstName} ${user!.data!.lastName}")
                    ],
                  ),
                )
              : const Center(child: Text("No User Object")),
    );
  }
}
