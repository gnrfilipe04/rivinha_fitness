import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Color _appBarColor = Colors.blue; // Cor inicial da AppBar
  static const Duration _animationDuration =
      Duration(milliseconds: 500); // Duração da animação

  void _changeColor() {
    setState(() {
      // Altere a cor da AppBar para uma nova cor quando o botão for clicado
      _appBarColor = _appBarColor == Colors.blue
          ? Colors.red
          : Colors.blue; // Alternar entre azul e vermelho
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(
            duration: _animationDuration,
            color: _appBarColor, // Cor da AppBar é dinâmica
            child: AppBar(
              title: const Text('Color Change AppBar'),
              elevation: 0, // Removendo a sombra da AppBar
            ),
          ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: _changeColor,
                child: const Text('Trocar Cor'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
