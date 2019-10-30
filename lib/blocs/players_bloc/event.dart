import 'package:cookies_flutter/models/player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}

enum SourceOfUpdate {
  fromCache,
  fromNetwork,
  fromConsistencyUpdate,
  unspecified
}

class UpdatePlayers extends PlayersEvent {
  final List<Player> players;

  /// Used primarily for debugging purposes
  final SourceOfUpdate sourceOfUpdate;

  const UpdatePlayers(this.players,
      [this.sourceOfUpdate = SourceOfUpdate.unspecified]);

  @override
  List<Object> get props => [players, sourceOfUpdate];

  @override
  String toString() =>
      'Update Players { players: $players, sourceOfUpdate: $sourceOfUpdate }';
}

class FetchPlayers extends PlayersEvent {
  const FetchPlayers();
}

class CreatePlayer extends PlayersEvent {
  final PlayerInput playerToCreate;

  CreatePlayer(this.playerToCreate);

  @override
  List<Object> get props => [playerToCreate];
}
