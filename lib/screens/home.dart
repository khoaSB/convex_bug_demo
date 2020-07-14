import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:convex_bug_demo/bloc/menu_bloc.dart';
import 'package:convex_bug_demo/key.dart';
import 'package:convex_bug_demo/screens/edit.dart';
import 'package:convex_bug_demo/screens/profile.dart';
import 'package:convex_bug_demo/screens/search.dart';
import 'package:convex_bug_demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget menuScreen;
  MenuBloc menuBloc;

  List<TabItem> _tabItems = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.edit, title: 'Edit'),
    TabItem(icon: Icons.person, title: 'Profile'),
    TabItem(icon: Icons.search, title: 'Search'),
  ];

  @override
  void initState() {
    super.initState();
    menuBloc = BlocProvider.of<MenuBloc>(context);
    menuScreen = WelcomeScreen();
  }

  void changeScreen(int index) {
    switch (index) {
      case 0:
        _updateScreen(0);
        menuBloc.add(GoToWelcome());
        break;
      case 1:
        _updateScreen(1);
        menuBloc.add(GoToEdit());
        break;
      case 2:
        _updateScreen(2);
        menuBloc.add(GoToProfile());
        break;
      case 3:
        _updateScreen(3);
        menuBloc.add(GoToSearch());
        break;
      default:
        _updateScreen(0);
        menuBloc.add(GoToWelcome());
    }
  }

  void _updateScreen(int index) {
    setState(() {
      switch (index) {
        case 0:
          menuScreen = WelcomeScreen();
          break;
        case 1:
          menuScreen = EditScreen();
          break;
        case 2:
          menuScreen = ProfileScreen();
          break;
        case 3:
          menuScreen = SearchScreen();
          break;
        default:
          menuScreen = WelcomeScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is AtWelcome) {
          _updateScreen(0);
        } else if (state is AtEdit) {
          _updateScreen(1);
        } else if (state is AtProfile) {
          _updateScreen(2);
        } else if (state is AtSearch) {
          _updateScreen(3);
        }
      },
      child: Scaffold(
        body: menuScreen,
        bottomNavigationBar: ConvexAppBar(
          key: convexKey,
          initialActiveIndex: 2, // the bug happens when I add this line.
          style: TabStyle.react,
          items: _tabItems,
          onTap: changeScreen,
        ),
      ),
    );
  }
}
