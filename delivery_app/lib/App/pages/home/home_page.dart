import 'package:dw9_delivery_app/App/Core/ui/widget/product_tile.dart';
import 'package:dw9_delivery_app/App/pages/home/home_controller.dart';
import 'package:dw9_delivery_app/App/pages/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/ui/base_state/base_state.dart';
import '../../Core/ui/widget/shopping_bag.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        final orders = state.shoppingBag
                            .where((order) => order.product == product);
                        return ProductTile(
                          product: product,
                          orderProduct: orders.isEmpty ? null : orders.first,
                        );
                      }),
                ),
                Visibility(
                    visible: state.shoppingBag.isNotEmpty,
                    child: ShoppingBagWidget(
                      bag: state.shoppingBag,
                    ))
              ],
            );
          }),
    );
  }
}
