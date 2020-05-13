import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:provider/provider.dart';

import 'brew_tile.dart';

class brewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
