import 'package:flutter/material.dart';
import 'primeira_tela.dart';
import 'segunda_tela.dart';
import 'terceira_tela.dart';
import 'quarta_tela.dart';
import 'ganhou.dart';
import 'perdeu.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/primeira',
      routes: {
        '/primeira': (context) => const PrimeiraTela(),
        '/segunda': (context) => const SegundaTela(),
        '/terceira': (context) => const TerceiraTela(),
        '/quarta': (context) => const QuartaTela()
      },
    );
  }
}
