import 'package:flutter/material.dart';
import 'App/Core/config/env.dart';
import 'App/dw9_delivery_app.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const Dw9DeliveryApp());
}
