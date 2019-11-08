import 'package:flutter/cupertino.dart';
import 'package:manager_state_provider/hero_model.dart';

class HeroesController extends ChangeNotifier{

  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Iron man'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Super Man')
  ];

  checkFavorite(HeroModel hero){
    hero.isFavorite = !hero.isFavorite;
    notifyListeners();
  }

}