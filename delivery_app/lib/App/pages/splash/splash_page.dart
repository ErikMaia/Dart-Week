import 'package:dw9_delivery_app/App/Core/ui/helper/size_extentions.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Splash Page")),
      body: ColoredBox(
        color: const Color(0xff140e0e),
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: context.screenWidth,
              child: Image.asset("assets/images/lanche.png", fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: context.percentHeight(0.3)),
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 30),
                DeliveryButton(
                  label: "ACESSAR",
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  height: 35,
                  width: context.percentWidth(.6),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
