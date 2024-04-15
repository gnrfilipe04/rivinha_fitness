import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rivinha_fitness/app/auth/auth_store.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthStore _store = AuthStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Observer(
              builder: (_) => Form(
                    key: _store.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 200),
                          const FlutterLogo(size: 150),
                          const SizedBox(height: 20),
                          TextFormField(
                            onChanged: (v) => _store.customerModel.setEmail(v),
                            validator: (v) =>
                                _store.customerModel.email.validator(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onChanged: (v) =>
                                _store.customerModel.setPassword(v),
                            validator: (v) =>
                                _store.customerModel.password?.validator(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _store.authentication,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.green500,
                              minimumSize: const Size.fromHeight(60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: MyColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ]),
                  )),
        ),
      ),
    );
  }
}
