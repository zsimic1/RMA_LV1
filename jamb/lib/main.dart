import 'dart:math';
import 'package:flutter/material.dart';
import 'package:jamb/game.dart';

void main() => runApp(MaterialApp(
  home: Jamb(),
));

class Jamb extends StatefulWidget {
  @override
  _JambState createState() => _JambState();
}

class _JambState extends State<Jamb> {

  Game game = new Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('Jamb demo'),
          centerTitle: true,
          backgroundColor: Colors.grey[500],
          elevation: 0.0,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    displayHeader(),
                    displayLine(0),
                    displayLine(1),
                    displayLine(2),
                    displayLine(3),
                    displayLine(4),
                    displayLine(5),
                    displayFooter()
                  ],
                ),
              ],)

        )
    );
  }


  Row displayLine(int row)
  {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            setState(() {
              game.holdDice(row);
            });
          },
          child: Text('#${row+1}'),
          color: game.dices[row].lock ? Colors.red : Colors.white,
        ),
        SizedBox(width: 15.0),
        Image(
          height: 50,
          image: AssetImage(
              'assets/images/dice${game.dices[row].value}.png'
          ),
        )
      ],
    );

  }

  Row displayHeader() {
    return Row(

      children: [
        FlatButton(
          onPressed: () {},
          child: Text('Dice No.'),
          color: Colors.white,
        ),
        FlatButton(
          onPressed: () {}, //rezultat kocke
          child: Text('Score'),
          color: Colors.white,

        )
      ],
    );
  }

  Row displayFooter()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FlatButton(
            onPressed: () {
              setState(() {
                game.rollDice(5);
              });
            }, //baci kocku
            child: Text('Roll'),
            color: Colors.blue
        ),
        SizedBox(width: 20.0),
        Text('Straight',
          style: TextStyle(
              color: game.isStraight() ? Colors.green : Colors.grey,
              letterSpacing: 2,
              fontSize: 15, fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: 8.0),
        Text('Poker',
          style: TextStyle(
              color: game.isPoker() ? Colors.green : Colors.grey,
              letterSpacing: 2,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: 8.0),
        Text('Jamb',
          style: TextStyle(
              color: game.isJamb() ? Colors.green : Colors.grey,
              letterSpacing: 2,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}



