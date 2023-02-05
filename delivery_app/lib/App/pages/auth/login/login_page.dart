import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_appbar.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: context.textStyle.textTitle),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: DeliveryButton(
                      label: 'ENTRAR',
                      width: double.infinity,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não possui uma conta',
                  style: context.textStyle.textBold,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/auth/register');
                    },
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
