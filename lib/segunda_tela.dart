import 'dart:math';
import 'package:flutter/material.dart';
import 'ganhou.dart';
import 'perdeu.dart';


class SegundaTela extends StatefulWidget {
  const SegundaTela({Key? key}) : super(key: key);

  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  late int _numeroAleatorio;
  final TextEditingController _controller = TextEditingController();
  String _mensagem = '';
  bool _acertou = false;

  @override
  void initState() {
    super.initState();
    _gerarNumeroAleatorio();
  }

  void _gerarNumeroAleatorio() {
    final random = Random();
    _numeroAleatorio = random.nextInt(100) + 1;
  }

  void _verificarResposta() {
  final int? resposta = int.tryParse(_controller.text);
  if (resposta != null) {
    setState(() {
      if (resposta == _numeroAleatorio) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GanhouTela()));
      } else if (resposta < _numeroAleatorio) {
        _mensagem = 'Tente um número maior.';
      } else {
        _mensagem = 'Tente um número menor.';
      }
    });
  } else {
    setState(() {
      _mensagem = 'Por favor, insira um número válido.';
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Adivinhe o número entre 1 e 100:'),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Insira um número',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verificarResposta,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(
              _mensagem,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _mensagem.contains('Parabéns') ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/primeira');
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
