import 'package:flutter/material.dart';


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
    List<Widget> imgs = [ //Lista que retorna um conjunto de widget
      _img("assets/images/dog1.png"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.png"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.png"),
    ];

    return ListView.builder(
        itemCount: imgs.length, //recebe a quantidade de elementos da lista
        itemExtent: 300, //extende as imagens a 300 px
        itemBuilder: (context, index) {
          return imgs[index];
          /*Image img = imgs[index];   //o return tbm pode ser assim
          return img;*/
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


