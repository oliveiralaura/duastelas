import 'dart:math';
import 'package:flutter/material.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({Key? key}) : super(key: key);

  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
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
    _numeroAleatorio = random.nextInt(50) + 1;
  }

  void _verificarResposta() {
    final int? resposta = int.tryParse(_controller.text);
    if (resposta != null) {
      setState(() {
        if (resposta == _numeroAleatorio) {
          _mensagem = 'Parabéns, você acertou!';
          _acertou = true;
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
        title: const Text('Terceira Tela'),
      ),
      body: Center(
        child: _acertou
            ? ElevatedButton(
                onPressed: () {
                  setState(() {
                    _gerarNumeroAleatorio();
                    _acertou = false;
                    _mensagem = '';
                    _controller.clear();
                  });
                },
                child: const Text('Jogar Novamente'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Adivinhe o número entre 1 e 50:'),
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
