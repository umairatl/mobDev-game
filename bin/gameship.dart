import 'dart:math';

final random = Random();

void main() {
SpaceShip s1 = ArmoredSpaceShip(1000, 100);
SpaceShip s2 = HighSpeedSpaceShip(1000, 100);

BattleField bf = BattleField();

bf.startBattle(s1, s2);
}

abstract class SpaceShip{
  int health;
  int firePower ;

  void hit(int atk);
  void isDestroyed();

  SpaceShip(this.health, this.firePower);
}

class BattleField{

  void startBattle(SpaceShip sp1, SpaceShip sp2){
    do {
      sp1.hit(sp2.firePower);
  print("Spaceship 1 is getting hit");
  print("Health: ${sp1.health}");
  sp2.hit(sp1.firePower);
  print("Spaceship 2 is getting hit");
  print("Health: ${sp2.health}");
  } while (sp1.health > 0 && sp2.health > 0);
  }
}

class ArmoredSpaceShip extends SpaceShip{
  
  double randomPower = random.nextDouble() * 0.4;
  
   @override
    void hit(int atk){
      double damage;
      damage = atk - randomPower;

      health= health - damage.toInt();
    }

    @override
    void isDestroyed(){
      print('Armored Ship has lost the game');
    }

    ArmoredSpaceShip(health, firePower): super(health, firePower);
}

class HighSpeedSpaceShip extends SpaceShip{
   

  @override
    void hit(int atk){
      bool dodge = random.nextBool();
      

      if(dodge == false){
        print('hit is taken');
        health = health - atk;
      }
      else{print('dodged the atk');}
    }

    @override
    void isDestroyed(){
      print('High Spped Ship has lost the game');
    }
        HighSpeedSpaceShip(health, firePower): super(health, firePower);
}
