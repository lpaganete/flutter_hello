import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';

class DogPage extends StatelessWidget {

final Dog dog;
DogPage (this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.nome),
        centerTitle: true,
      ),
      
      body: _body(),

    );
 }
      
      
      //Método que retorna o body
        _body() {
         return  Center(
            child: Expanded(
              flex: 5,
              child: Image.asset(
              dog.foto,
              fit: BoxFit.cover
              ),
            ),
        );
      }

}

