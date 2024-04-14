import 'package:flutter/material.dart';
import 'package:rivinha_fitness/app/auth/auth_store.dart';
import 'package:rivinha_fitness/app/config/app_provider.dart';
import 'package:rivinha_fitness/theme/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthStore _store = provider<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: const Text('Conclua seu cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (v) => _store.name = v,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (v) => _store.phoneNumber = v,
                  decoration: const InputDecoration(
                    labelText: 'Celular',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                FormField(builder: (state) {
                  return TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Foto',
                      border: OutlineInputBorder(),
                    ),
                  );
                }),
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
                    'Concluir cadastro',
                    style: TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
