import 'package:flutter/material.dart';
import 'package:manager_state_provider/hero_model.dart';
import 'package:manager_state_provider/heroes_controller.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _buildList() {

    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItens(heroesController.heroes[index]);
      },
    );
  }

  _buildItens(HeroModel hero) {

    HeroesController heroesController = Provider.of<HeroesController>(context);

    return ListTile(title: Text(hero.name),
    trailing: hero.isFavorite ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star_border),
    onTap: (){
      heroesController.checkFavorite(hero);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
            return Text('${heroesController.heroes.where((i) => i.isFavorite).length}', style: TextStyle(fontSize: 20),);
          }
        ),
      ),
      body: Consumer<HeroesController>(
          builder: (context, heroesController, widget) {
        return _buildList();
      }),
    );
  }
}
