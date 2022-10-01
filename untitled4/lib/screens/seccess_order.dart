import 'package:flutter/material.dart';
class SuccesOrder extends StatelessWidget {
  const SuccesOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Order Added Successfully", style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
