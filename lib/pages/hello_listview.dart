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

    return ListView.builder( //objetivo agr é converter a class Dog para widget
        itemCount: dogs.length, //recebe a quantidade de elementos da lista
        itemExtent: 300, //extende as imagens a 300 px
        itemBuilder: (context, index) {
         
          Dog dog = dogs[index]; //recuperando o objeto cachorro

          return _img(dog.foto);  // passando um widget imagem e dentro passando o endereço da foto que esta no contrutor 
          
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


