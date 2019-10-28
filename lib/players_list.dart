import 'package:cookies_flutter/blocs/players_bloc/players_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersList extends StatelessWidget {
  final PlayersBloc _bloc = PlayersBloc()..add(FetchPlayers());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Add New Player'),
          onPressed: () {
            _bloc.add(AddPlayer());
          },
        ),
        BlocBuilder<PlayersBloc, PlayersState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is PlayersLoaded) {
              return Column(
                children: state.players
                    .map((player) => Text(
                        "id: ${player.entityUrn}, name: ${player.name}, points: ${player.points}"))
                    .toList(),
              );
            } else {
              return Text('Loading...');
            }
          },
        ),
      ],
    );
  }
}
