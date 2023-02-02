// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../rest_client/custom_dio.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;
  const ApplicationBinding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      Provider(create: (context) => CustomDio()),
    ],
      child: child);
  }
}
