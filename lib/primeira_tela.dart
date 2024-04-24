import 'package:flutter/material.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Ínicio'),
        
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para o nível fácil
                Navigator.pushNamed(context, '/segunda');
              },
              child: const Text('Nível Fácil'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para o nível médio
                Navigator.pushNamed(context, '/terceira');
              },
              child: const Text('Nível Médio'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar para o nível difícil
                Navigator.pushNamed(context, '/quarta');
              },
              child: const Text('Nível Difícil'),
            ),
          ],
        ),
      ),
    );
  }
}
