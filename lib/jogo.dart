import 'package:flutter/material.dart';
import 'dart:math';
class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = const AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";

  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

  switch (escolhaApp){
    case "pedra" :
      setState(() {
        _imagemApp = const AssetImage("assets/images/pedra.png");
      });
    break;
    case "papel" :
      setState(() {
        _imagemApp = const AssetImage("assets/images/papel.png");
      });
    break;
    case "tesoura" :
      setState(() {
        _imagemApp = const AssetImage("assets/images/tesoura.png");
      });
    break;
  }

  //Usuário ganhador
  if (
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
    (escolhaUsuario == "papel" && escolhaApp == "pedra")
  ){
    setState(() {
      _mensagem = "Você ganhou!  :)";
    });
  //App ganhador
  } else if (
    (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
    (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
    (escolhaApp == "papel" && escolhaUsuario == "pedra")
  ){ 
    setState(() {
      _mensagem = "Você perdeu  :(";
    });
  } else {
    setState(() {
      _mensagem = "Foi um empate!";
    });
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //text
          //image
          //text resultado
          //row 3 images
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: _imagemApp,),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("assets/images/pedra.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("assets/images/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("assets/images/tesoura.png", height: 100,),
              )
              /*
              Image.asset("assets/images/pedra.png", height: 100,),
              Image.asset("assets/images/papel.png", height: 100,),
              Image.asset("assets/images/tesoura.png", height: 100,),
              */
            ],
          )
        ],
      ),
    );
  }
}