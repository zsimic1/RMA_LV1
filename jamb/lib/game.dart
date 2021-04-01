import 'dart:math';
import 'package:jamb/Models/diceModel.dart';

class Game
{
  List<DiceModel> dices = [DiceModel(1, false),DiceModel(1, false),DiceModel(1, false),DiceModel(1, false),DiceModel(1, false),DiceModel(1, false)];

  void holdDice(int dice) {

    dices[dice].lock = !dices[dice].lock;

  }

  void rollDice(int numOfDices) {

    for (int i = 0; i <= numOfDices; i++) {
      print(dices[i].lock);

      if (!dices[i].lock) {
        dices[i].value = Random().nextInt(6) + 1;
      }
      print(dices[i].value);
    }
  }

  bool isStraight()
  {
    if( (countNumberFrequency(1)>=1 || countNumberFrequency(6)>=1) &&
        countNumberFrequency(2)>=1 && countNumberFrequency(3)>=1 &&
        countNumberFrequency(4)>=1 && countNumberFrequency(5)>=1
    )
    {
      return true;
    }

    else
    {
      return false;
    }
  }

  bool isPoker()
  {
    for(int i = 0; i<dices.length;i++)
    {
      if(countNumberFrequency(dices[i].value)>=4 && dices[i].value != 0)
      {
        return true;
      }
    }
    return false;
  }

  bool isJamb()
  {
    for(int i = 0; i<dices.length;i++)
    {
      if(countNumberFrequency(dices[i].value)>=5 && dices[i].value != 0)
      {
        return true;
      }
    }
    return false;
  }

  int countNumberFrequency(int diceScore)
  {
    int counter = 0;
    for (int i=0; i<dices.length;i++) {
      if(dices[i].value == diceScore)
      {
        counter++;
      }
    }
    return counter;
  }
}