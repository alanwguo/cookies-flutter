import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:uuid/uuid.dart';

import '../../data_store_lib/store.dart';
import '../../models/models.dart';
import 'event.dart';
import 'state.dart';

final uuid = Uuid();

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
    } else if (event is CreatePlayer) {
      yield* _mapAddPlayerEventToState(event);
    }
  }

  Stream<PlayersState> _mapFetchPlayersEventToState(FetchPlayers event) async* {
    unawaited(_fetchPlayersSubscription?.cancel());
    _fetchPlayersSubscription = _store.peekAll().listen((players) {
      add(UpdatePlayers(players));
    });
    yield PlayersLoading();
  }

  Stream<PlayersState> _mapUpdatePlayersEventToState(
      UpdatePlayers event) async* {
    yield PlayersLoaded(event.players);
  }

  Stream<PlayersState> _mapAddPlayerEventToState(CreatePlayer event) async* {
    final playerInput = event.playerToCreate;
    final player = Player((b) => b
      ..entityUrn = PlayerUrn(uuid.v4())
      ..name = playerInput.name
      ..points = playerInput.points);
    _store.addRecord(player);
    // No State change necessary
    yield state;
  }
}
