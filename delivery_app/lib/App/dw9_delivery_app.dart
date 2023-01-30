import 'package:dw9_delivery_app/App/Core/ui/Style/colors_app.dart';
import 'package:dw9_delivery_app/App/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.black)),
          primaryColor: ColorsApp.Instance.primary,
          colorScheme: ColorScheme.fromSeed(
              seedColor: ColorsApp.Instance.primary,
              primary: ColorsApp.Instance.primary,
              secondary: ColorsApp.Instance.secondary)),
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
