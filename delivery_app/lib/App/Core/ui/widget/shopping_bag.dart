import 'package:dw9_delivery_app/App/Core/extentions/formater.dart';
import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/Core/ui/helper/size_extentions.dart';
import 'package:dw9_delivery_app/App/dto/order_product_dto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDTO> bag;

  const ShoppingBagWidget({
    Key? key,
    required this.bag,
  }) : super(key: key);
  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('accessToken')) {
      // ignore: unused_local_variable
      final loginResult = await navigator.pushNamed('/auth/login');
    }
  }
  @override
  Widget build(BuildContext context) { 
    var totalBag = bag.fold<double>(0,(total,element)=> total + element.totalPrice).currencyPTBR;
    return Container(
      padding: const EdgeInsets.all(20),
      width: context.screenWidth,
      height: context.screenHeight,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: ElevatedButton(
          onPressed: () => _goOrder(context),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'VER SACOLA',
                  style: context.textStyle.textExtraBold.copyWith(fontSize: 14),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  totalBag,
                  style: context.textStyle.textExtraBold.copyWith(fontSize: 14),
                ),
              )
            ],
          )),
    );
  }
}
