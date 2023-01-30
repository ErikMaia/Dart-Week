import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Splash Page")),
      body: Column(children: [DeliveryButton(label: "Button", onPressed: () {  },),TextFormField()]),
    );
  }
}