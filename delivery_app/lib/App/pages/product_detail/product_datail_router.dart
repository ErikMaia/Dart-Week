import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_datail_controler.dart';
import 'product_datail_page.dart';

class ProductDetailRouter {
  static Widget get page => MultiProvider(
        providers: [
          Provider(create: (context) => ProductDetailControler()),
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return ProductDetailPage(product: args['product'], order: args['order']);
        },
      );
}
