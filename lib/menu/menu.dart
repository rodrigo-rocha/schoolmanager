import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_app_ihc/functions/functions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Menu extends StatefulWidget{
  @override
  MenuState createState()=> MenuState();
}

class MenuState extends State<Menu> {

  double _tilesRadius = 30.0; // 20.0
  Color _shadowColor = Colors.black;
  double _iconSize = 60.0;
  Color tileColor = Colors.white;
  Color bgColor = Colors.white;

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      color: tileColor,
      elevation: 1.0, // Relevo dos botões
      borderRadius: BorderRadius.circular(10), // Tiles Border Radius
      shadowColor: _shadowColor,

      child: InkWell
        (
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
        backgroundColor: Colors.white,
        body: StaggeredGridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.vertical,
          crossAxisSpacing: 12.0, // Spacing
          mainAxisSpacing: 12.0, // Spacing
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0), // Check horizontal 16? ou 26-26
          children: <Widget>[

            Functions.showLogo(),
            _buildTileIcon('My Schedule', Icons.calendar_today, () => Navigator.of(context).pushNamed('/week_schedule')),
            _buildTileIcon('Contacts', Icons.supervised_user_circle, () => Navigator.of(context).pushNamed('/user_tab_controller')),
            _buildTileIcon('Courses', Icons.book, () => Navigator.of(context).pushNamed('/courses_tab_controller')),
            _buildTileIcon('Notes', Icons.note, () => Navigator.of(context).pushNamed('/notes_tab_controller')),
            _buildTileIcon('Chat', Icons.chat, () => Navigator.of(context).pushNamed('/chat_list')),
            _buildTileIcon('Calendar', Icons.today, () => Navigator.of(context).pushNamed('/calendar')),
            _buildTileIcon('Timeline', Icons.timeline, () => Navigator.of(context).pushNamed('/timeline')),
            _buildTileIcon('Share', Icons.share, () => Navigator.of(context).pushNamed('/share')),
            _buildTileIcon('Reports', Icons.multiline_chart, () => Navigator.of(context).pushNamed('/reports')),
            _buildTileIcon('Settings', Icons.settings, () => Navigator.of(context).pushNamed('/settings')),

          ],
          staggeredTiles: [
            StaggeredTile.fit(3),
            StaggeredTile.fit(3),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
            StaggeredTile.fit(1),
          ],
        )
    );
  }

  Widget availablePerson(String name, Color color) {

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Material (
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Icon(icon, color: Colors.blue, size: 40),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                title,
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                maxLines: 1,
              ),
            ],
          ),
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
            borderRadius: BorderRadius.circular(2),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image.asset(path, color: Colors.blue, scale: 3),
              )
            )
          ),
          //SizedBox(height: 2),
          Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15.0),)
        ]
      ),
    );
  }
}