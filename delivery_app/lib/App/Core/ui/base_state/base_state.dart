import 'package:dw9_delivery_app/App/Core/ui/helper/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/menssage.dart';

abstract class BaseState<T extends StatefulWidget,C extends BlocBase> extends State<T> with Loader, Mensage{
  late final C controller;
  @override
  void initState(){
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      onReady();
    });
  } 
  void onReady(){}
}