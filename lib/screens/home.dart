import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:convex_bug_demo/bloc/menu_bloc.dart';
import 'package:convex_bug_demo/key.dart';
import 'package:convex_bug_demo/screens/edit.dart';
import 'package:convex_bug_demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _appBar;
  Widget _appBody;
  MenuBloc _menuBloc;

  List<TabItem> _tabItems = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.edit, title: 'Edit'),
  ];

  @override
  void initState() {
    super.initState();
    _menuBloc = BlocProvider.of<MenuBloc>(context);
    _appBar = welcomeScreenAppBar();
    _appBody = welcomeScreenBody();
  }

  void _changeScreen(int index) {
    switch (index) {
      case 0:
        _updateScreen(0);
        _menuBloc.add(GoToWelcome());
        break;
      case 1:
        _updateScreen(1);
        _menuBloc.add(GoToEdit());
        break;
      default:
        _updateScreen(0);
        _menuBloc.add(GoToWelcome());
    }
  }

  void _updateScreen(int index) {
    setState(() {
      switch (index) {
        case 0:
          _appBar = welcomeScreenAppBar();
          _appBody = welcomeScreenBody();
          break;
        case 1:
          _appBar = editScreenAppBar();
          _appBody = editScreenBody();
          break;
        default:
          _appBar = welcomeScreenAppBar();
          _appBody = welcomeScreenBody();
      }
    });
  }

  AppBar welcomeScreenAppBar() {
    return AppBar(title: Text('Welcome Screen'));
  }

  Widget welcomeScreenBody() {
    return WelcomeScreen();
  }

  AppBar editScreenAppBar() {
    return AppBar(title: Text('Edit Screen'));
  }

  Widget editScreenBody() {
    return EditScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is AtWelcome) {
          _updateScreen(0);
        } else if (state is AtEdit) {
          _updateScreen(1);
        }
      },
      child: Scaffold(
        appBar: _appBar,
        body: _appBody,
        bottomNavigationBar: ConvexAppBar(
          key: convexKey,
          style: TabStyle.react,
          items: _tabItems,
          onTap: _changeScreen,
        ),
      ),
    );
  }
}
