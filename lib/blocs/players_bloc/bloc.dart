import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cookies_flutter/data_store_lib/store.dart';
import 'package:cookies_flutter/models/models.dart';
import 'event.dart';
import 'state.dart';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final _store = Store<PlayerUrn, Player>();
  StreamSubscription<Iterable<Player>> _fetchPlayersSubscription;

  @override
  PlayersState get initialState => PlayersNotLoaded();

  @override
  Stream<PlayersState> mapEventToState(PlayersEvent event) async* {
    if (event is FetchPlayers) {
      yield* _mapFetchPlayersEventToState(event);
    } else if (event is UpdatePlayers) {
      yield* _mapUpdatePlayersEventToState(event);
    } else if (event is AddPlayer) {
      yield* _mapAddPlayerEventToState(event);
    }
  }

  Stream<PlayersState> _mapFetchPlayersEventToState(FetchPlayers event) async* {
    _fetchPlayersSubscription?.cancel();
    _fetchPlayersSubscription = _store.peekAll().listen((players) {
      add(UpdatePlayers(players));
    });
    yield PlayersLoading();
  }

  Stream<PlayersState> _mapUpdatePlayersEventToState(
      UpdatePlayers event) async* {
    yield PlayersLoaded(event.players);
  }

  Stream<PlayersState> _mapAddPlayerEventToState(AddPlayer event) async* {
    _store.addRecord(event.playerToAdd);
    // No State change necessary
    yield state;
  }
}
