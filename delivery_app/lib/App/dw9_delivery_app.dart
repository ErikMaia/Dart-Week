import 'package:dw9_delivery_app/App/Core/ui/theme/theme_config.dart';
import 'package:dw9_delivery_app/App/pages/auth/login/login_page.dart';
import 'package:dw9_delivery_app/App/pages/auth/register/register_page.dart';
import 'package:dw9_delivery_app/App/pages/home/home_router.dart';
import 'package:dw9_delivery_app/App/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'Core/provider/application_binding.dart';
import 'pages/product_detail/product_datail_router.dart';

class Dw9DeliveryApp extends StatelessWidget {
  const Dw9DeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App',
        theme: ThemeConfig.instance.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => const LoginPage(),
          '/auth/register': (context) => const RegisterPage(),
        },
      ),
    );

  }
}
