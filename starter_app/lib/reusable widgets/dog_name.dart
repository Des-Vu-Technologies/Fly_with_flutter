import 'package:flutter/material.dart';

class DogName extends StatelessWidget {
  const DogName({
    Key? key,
    this.name
  }) : super(key: key);
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      width: 100,
      color: Colors.amber,
      child:  Text(name!),
    );
  }
}