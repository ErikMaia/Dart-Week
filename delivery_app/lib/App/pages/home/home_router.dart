import 'package:dw9_delivery_app/App/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/App/repositories/products/products_repository.dart';
import 'package:dw9_delivery_app/App/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepository>(
            create: (context) => ProductRepositoryImpl(dio: context.read()),
          ),
          Provider(create: (context)=>HomeController(context.read()))
        ],
        child: const HomePage(),
      );
}
