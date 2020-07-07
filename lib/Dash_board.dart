import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MaterialApp(
    home: Dash(),
  ));
}

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  Material Myitems(IconData iconData, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196f3),
      borderRadius: BorderRadius.circular(8.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                heading,
                style: TextStyle(color: new Color(color), fontSize: 20.0),
              ),
              Material(
                color: new Color(color),
                borderRadius: BorderRadius.circular(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print("Add");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Setting");
              },
            ),
          ],
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "resumemaster@resumemaster.in",
                  style: TextStyle(fontSize: 15.0),
                ),
                accountEmail: Text(
                  "resumemaster@resumemaster.in",
                  style: TextStyle(fontSize: 10.0),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    'R',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new CircleAvatar(
                      child: Image.asset(
                        "assests/login.PNG",
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text('DashBoard'),
                leading: Icon(Icons.dashboard),
              ),
              ListTile(
                title: Text('Tickets'),
                leading: Icon(Icons.flash_auto),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Master'),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                title: Text('User Management'),
                leading: Icon(Icons.group),
              ),
              ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.vpn_key),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Setting'),
              icon: Icon(Icons.settings),
            )
          ],
          onTap: (int index) {
            print(index.toString());
          },
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Header',
              style: TextStyle(fontSize: 16),
            ),
            StaggeredGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: <Widget>[
                Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
                Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
                Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
              ],
              staggeredTiles: [
                StaggeredTile.extent(2, 130),
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 150),
              ],
            ),
            Text(
              'Today',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ) /*StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
          Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
          Myitems(Icons.graphic_eq, "Total View", 0xffed622b),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
        ],
      ),*/
        );
  }
}
