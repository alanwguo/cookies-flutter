import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/player.dart';

@immutable
abstract class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

class PlayersLoading extends PlayersState {}

class PlayersLoaded extends PlayersState {
  final Iterable<Player> players;

  const PlayersLoaded(this.players);

  @override
  List<Object> get props => [players];

  @override
  String toString() => 'PlayersLoaded { players: $players }';
}

class PlayersNotLoaded extends PlayersState {}
