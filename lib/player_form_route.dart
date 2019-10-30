import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/players_bloc/players_bloc.dart';
import 'models/models.dart';

class PlayerFormRoute extends StatelessWidget {
  static const routeName = '/players/new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Player')),
      body: PlayerForm(
        onSaved: ({name, points}) {
          final playerInput = PlayerInput((b) => b
            ..name = name
            ..points = points);
          BlocProvider.of<PlayersBloc>(context).add(CreatePlayer(playerInput));
          Navigator.pop(context);
        },
      ),
    );
  }
}

class PlayerForm extends StatefulWidget {
  final void Function({String name, int points}) onSaved;

  PlayerForm({this.onSaved});

  @override
  _PlayerFormState createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final _formKey = GlobalKey<FormState>();
  String _nameInput = '';
  int _pointsInput = 0;
  final _nameFocusNode = FocusNode();
  final _pointsFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: _validateName,
            onFieldSubmitted: (_) {
              _nameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(_pointsFocusNode);
            },
            onSaved: (value) => _nameInput = value,
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Points'),
            keyboardType: TextInputType.number,
            validator: _validatePoints,
            onSaved: (value) => _pointsInput = int.tryParse(value) ?? 0,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) {
              _formSubmit();
            },
          ),
          MaterialButton(
            onPressed: _formSubmit,
            child: Text('Add Player'),
          )
        ],
      ),
    );
  }

  void _formSubmit() {
    final formState = _formKey.currentState;

    if (!formState.validate()) {
      return;
    }

    formState.save();
    widget.onSaved(name: _nameInput, points: _pointsInput);
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String _validatePoints(String value) {
    if (int.tryParse(value) == null) {
      return 'Points must be in number format.';
    }
    return null;
  }
}
