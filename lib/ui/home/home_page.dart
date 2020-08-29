import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mars_app/strings.dart';
import 'package:mars_app/ui/dimensions.dart';
import 'package:mars_app/ui/home/home_bloc.dart';
import 'package:mars_app/ui/themes.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HomeBloc _viewModel = HomeBloc();

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Themes.baseTheme(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(Strings.APP_NAME),
        ),
        body: widget._viewModel.getContent(_currentIndex),
        bottomNavigationBar: Card(
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Weather'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                title: Text('Explore'),
              ),
            ],
            onTap: (int index) {
              _changeState(index);
            },
          ),
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Dimensions.RADIUS_S,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget._viewModel.dispose();
  }

  void _changeState(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
