import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/players_bloc/players_bloc.dart';

class PlayersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Do nothing for now
            },
          )
        ],
      ),
      body: BlocBuilder<PlayersBloc, PlayersState>(
        bloc: BlocProvider.of<PlayersBloc>(context),
        builder: (context, state) {
          if (state is PlayersLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlayersLoaded) {
            final players = state.players;
            return ListView.separated(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return Text(
                    'urn: ${player.entityUrn}, name: ${player.name}, points: ${player.points}');
              },
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
