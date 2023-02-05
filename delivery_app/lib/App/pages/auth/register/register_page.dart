import 'package:dw9_delivery_app/App/Core/ui/Style/text_styles.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_appbar.dart';
import 'package:dw9_delivery_app/App/Core/ui/widget/delivery_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Text(
                'Cadastro',
                style: context.textStyle.textTitle,
              ),
              Text('Prencha os campos para criar o seu cadastro',
                  style: context.textStyle.textMedium),
              SizedBox(
                height: 30,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome')),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Email')),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Senha')),
              ),
              SizedBox(
                height: 30,
                child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Confirma Senha')),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(child: DeliveryButton(label: 'Cadastrar', onPressed: (){}, width: double.infinity),)
            ],
          ),
        ),
      ),
    );
  }
}
