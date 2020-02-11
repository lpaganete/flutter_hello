import 'package:flutter/material.dart';

//  Criando widget "blueButton", agora quando quiser instanciar outro botão, só preciso chamar a class BlueButton

class BlueButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  BlueButton (this.text, {@required this.onPressed, this.color = Colors.blue}); //Contrutor. O this.color = Colors.blue é um parametro que tem um valor default ja definido, caso ele não seja instanciado, pois é um parametro opcional

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: onPressed,
    );
  }
}
