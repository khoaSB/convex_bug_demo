import 'package:convex_bug_demo/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  MenuBloc _menuBloc;

  @override
  void initState() {
    super.initState();
    _menuBloc = BlocProvider.of<MenuBloc>(context);
  }

  Widget textField() {
    return TextFormField(
      controller: _textFieldController,
      decoration: InputDecoration(
        hintText: 'Edit Screen',
        filled: true,
        border: OutlineInputBorder(),
      ),
      autocorrect: false,
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: () {
        _menuBloc.add(GoToWelcome());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Screen')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textField(),
            submitButton(),
          ],
        ),
      ),
    );
  }
}
