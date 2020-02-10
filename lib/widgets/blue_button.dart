import 'package:flutter/material.dart';

//  Criando widget "blueButton", agora quando quiser instanciar outro botão, só preciso chamar a class BlueButton

class BlueButton extends StatelessWidget {
  String text;
  Function onPressed;

  BlueButton (this.text, {@required this.onPressed}); //Contrutor

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed
    );
  }
}
