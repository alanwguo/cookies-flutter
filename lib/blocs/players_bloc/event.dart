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

int idGen = 1;

class AddPlayer extends PlayersEvent {
  final Player playerToAdd;

  AddPlayer()
      : playerToAdd = Player((b) => b
          ..entityUrn = PlayerUrn(idGen.toString())
          ..name = "Alan $idGen"
          ..points = idGen++);

  @override
  List<Object> get props => [playerToAdd];
}
