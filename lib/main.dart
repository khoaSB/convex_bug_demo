import 'package:convex_bug_demo/bloc/menu_bloc.dart';
import 'package:convex_bug_demo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Convex Bug Demo',
      theme: ThemeData(appBarTheme: AppBarTheme(centerTitle: true)),
      home: BlocProvider(
        create: (context) => MenuBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
