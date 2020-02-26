import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/dog_page.dart';
import 'package:flutter_hello/utils/nav.dart';

class Dog {
  String nome;
  String foto;
  Dog(this.nome, this.foto);
}


class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {


      bool _gridView = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        actions: <Widget>[ //Arrey de widgets que permite colocar qualquer widget na appbar
          IconButton(icon: Icon(Icons.list), onPressed: (){  //Class IconButton adiciona botoes a appbar
            print("Lista");
           setState(() {
              _gridView = false; // Se eu clicar no botão da lista, ele vai retornar para variavel false
           });  //QUANDO ESSE PEDAÇO DE CODIGO CABAR DE EXECUTAR, ELE VAI CHAMAR O MÉTODO BUILD NOVAMENTE E REDESENHAR A TELA

          },),
           IconButton(icon: Icon(Icons.grid_on), onPressed: (){
            print("Grid");
            setState(() {
              _gridView = true; // se eu clicar no botão da grid, ele vai retornar true
            });
          },)
        ],
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

    if(_gridView){
      return GridView.builder( 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),  //Adciona mais colunas a listView
        itemCount: dogs.length,
        itemBuilder: (context, index) { // Responsavel por retornar o layout (widget) dessa celula
         
          return _itemView(dogs, index);  
          
       },
    );
    }else {
      return ListView.builder( 
        itemExtent: 300,
        itemCount: dogs.length,
        itemBuilder: (context, index) { // Responsavel por retornar o layout (widget) dessa celula
         
          return _itemView(dogs, index);  
          
       },
    );
    }

  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index]; //recuperando o objeto cachorro
    
    return GestureDetector( //Permite adicionar metodo de click em widgets que não sao bot
        onTap: () {
          push(context, DogPage(dog));
        },
         child: Stack( // Funciona como uma pilha
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
      ),
    ); 
  }

   _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}


