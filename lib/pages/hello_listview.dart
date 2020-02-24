import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;
  Dog(this.nome, this.foto);
}


class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "ListView"
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [ //Lista da classe cachorro  //arrei de cachorros 
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Hottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    return GridView .builder( 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),  //Adciona mais colunas a listView
        itemCount: dogs.length,
        itemBuilder: (context, index) { // Responsavel por retornar o layout (widget) dessa celula
         
          Dog dog = dogs[index]; //recuperando o objeto cachorro

          return Stack( // Funciona como uma pilha
            fit: StackFit.expand, //Expande a imagem até o máximo (no caso 300px que foi definido)
            children: <Widget>[
              _img(dog.foto), // A imagem sempre tem que vir antes do nome
              Align( // Para mudar a posição do texto 
                alignment: Alignment.topLeft,
                      child: Container(
                      margin: EdgeInsets.all(12), // define uma margem para o container
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration( // Possibilita a personalização do container 
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(16), //Adiciona uma borda arredondada
                      ),
                        child: Text(dog.nome,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                ),
              ),
            ],
          );  
          
       },
    );
  }

  Widget _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}


