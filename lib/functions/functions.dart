import 'package:flutter/material.dart';
//import 'package:school_manager/menu/main_menu.dart';

class Functions {

  static Widget showLogo() {

    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }

  static Widget sideBar(BuildContext context) {

    String img = 'https://scontent.flis4-1.fna.fbcdn.net/v/t1.0-9/54430395_2199184333474025_1424275597042909184_n.jpg?_nc_cat=102&_nc_ht=scontent.flis4-1.fna&oh=2a48f3ed61349d967bd8031ee9659a50&oe=5D028F90';

    return SizedBox(
      width: 250,
      child: Drawer(
        elevation: 5.0,
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Rodrigo Rocha"),
              accountEmail: Text('rocha.rodrigo@ua.pt'),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                      NetworkImage(img)
                  )
                ),
              ),
              onDetailsPressed: () {
                /// TODO: Implement more details
              },
              otherAccountsPictures: <Widget>[
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.cloud_queue),
                  onPressed: null,
                ),
              ],
            ),
            new Column(
              children: <Widget>[
                _addListItem("Calendar", Icons.calendar_today, '/calendar', context),
                _addListItem("Courses", Icons.book, '/courses', context),
                _addListItem("Notes", Icons.speaker_notes, '/notes', context),
                _addListItem("Teachers", Icons.supervised_user_circle, '/teachers', context),
                _addListItem("Settings", Icons.settings, '/settings', context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget> [
                ButtonBar(
                  alignment: MainAxisAlignment.center ,
                  children: <Widget> [
                    IconButton(
                      icon: new Icon(Icons.exit_to_app),
                      onPressed: null,
                    ),
                    IconButton(
                      icon: new Icon(Icons.power_settings_new),
                      onPressed: null,
                    ),
                    IconButton(
                      icon: new Icon(Icons.help_outline),
                      onPressed: null,
                    )
                  ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static ListTile _addListItem(String name, IconData icon, String path, BuildContext context) {
    return new ListTile(
      title: new Text(name),
      leading: new Icon(icon),
      onTap: () {
        Navigator.pushNamed(context, path);
      },
    );
  }

  static var items1 = ['Edit', 'Delete'];

  static Widget appBar(String text, IconData icon, Widget popUpButton) {
    /// appBar() suporta um null no popUpButton, sendo que reprime este elemento

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    if(popUpButton != null) {
      return AppBar(
        key: _scaffoldKey,
        title: Text(text, textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Questrial',
            color: Colors.blue,
          ),
        ),
        leading: IconButton(
            icon: new Icon(Icons.view_headline), // clear all?
            onPressed: () {
              //_scaffoldKey.currentState.openDrawer();
            }
        ),

        elevation: 2.0,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          popUpButton,
        ],
      );
    }else{
      return AppBar(
        key: _scaffoldKey,
        title: Text(text, textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontFamily: 'Questrial',
            color: Colors.blue,
          ),
        ),
        leading: IconButton(
            icon: new Icon(Icons.view_headline), // clear all?
            onPressed: () {
              //_scaffoldKey.currentState.openDrawer();
            }
        ),

        elevation: 2.0,
        iconTheme: IconThemeData(
          color: Colors.grey, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      );
    }
  }

  static Widget createBar(String text, doneAction(), goBackAction()) {

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return AppBar(
      key: _scaffoldKey,
      title: Text(text, textAlign: TextAlign.center ,
        style: TextStyle(
          fontSize: 25.0,
          fontFamily: 'Questrial',
          color: Colors.blue,
        ),
      ),
      leading: IconButton(
          icon: new Icon(Icons.keyboard_backspace), // clear all?
          onPressed: () {
            goBackAction();
          }
      ),

      elevation: 2.0,
      iconTheme: IconThemeData(
        color: Colors.grey, //change your color here
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: new Icon(Icons.done),
          onPressed: ()
          {
            doneAction();
          },
          iconSize: 30,
        ),
      ],
    );
  }
}
