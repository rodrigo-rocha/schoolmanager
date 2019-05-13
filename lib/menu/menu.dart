// TODO: Reformat
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Menu extends StatefulWidget{
  @override
  MenuState createState()=> MenuState();
}

class MenuState extends State<Menu> {

  double _buttonRadius = 30.0; // 30.0
  double _tilesRadius = 20.0; // 20.0
  Color _shadowColor = Colors.black;
  double _buttonHeight = 100.0;
  double _iconSize = 20.0;
  //Color tileColor = Colors.grey[300];
  //Color bgColor = Colors.white;
  Color tileColor = Colors.white;
  Color bgColor = Colors.grey[100];

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        color: tileColor,
        elevation: 1.5, // Relevo dos botões
        borderRadius: BorderRadius.circular(_tilesRadius), // Tiles Border Radius
        shadowColor: _shadowColor,
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      //backgroundColor: Colors.grey[300],
        backgroundColor: bgColor,

        body: StaggeredGridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 12.0, // Spacing
          mainAxisSpacing: 12.0, // Spacing
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0), // Check horizontal 16? ou 26-26
          children: <Widget>[
            SizedBox(height: 20,),
            _buildTileIcon('Users', Icons.supervised_user_circle, () => Navigator.of(context).pushNamed('/user_tab_controller')),
            _buildTileIcon('Courses', Icons.book, () => Navigator.of(context).pushNamed('/courses_tab_controller')),

          ],
          staggeredTiles: [
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
            StaggeredTile.fit(2),
          ],
        )
    );
  }

  Widget _buildTileIcon(String title, IconData icon, action()) {
    return _buildTile(
        _tileFormat(title, icon),
        onTap: () =>
        {
        action(),
  }
    );
  }

  Widget _buildTileImage(String title, String path, action()) {
    return _buildTile(
        _tileFormatImage(title, path),
        onTap: () =>
        {
        action(),
  }
    );
  }

  Padding _tileFormat(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0))
              ],
            ),
            Material (
                color: Colors.blue,
                borderRadius: BorderRadius.circular(_buttonRadius),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(icon, color: Colors.white, size: _iconSize),
                    )
                )
            )
          ]
      ),
    );
  }

  Padding _tileFormatImage(String title, String path) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Material (
              //color: Functions.winegridColor(),
                color: tileColor,
                borderRadius: BorderRadius.circular(2),
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.asset(path, color: Colors.blue, scale: 3,),
                    )
                )
            ),
            SizedBox(height: 2),
            Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15.0),)
          ]
      ),
    );
  }
}