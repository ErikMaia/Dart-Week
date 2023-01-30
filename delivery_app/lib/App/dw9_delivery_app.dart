import 'package:dw9_delivery_app/App/Core/ui/theme/theme_data.dart';
import 'package:dw9_delivery_app/App/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeConfig.instance.theme,
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
