import 'package:flutter_arch/actions/actions.dart';

import '../state.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) => AppState(pokemons: state.pokemons, nick: userStateReducer(state.nick, action), counter: counterStateReducer(state.counter, action));


String _updNick(String currNick, UpdNickAction action) => action.newNick;

int _increment(int currCounter, IncrementCounterAction action) => currCounter + 1;


final Reducer<int> counterStateReducer = combineReducers<int>([
  TypedReducer<int, IncrementCounterAction>(_increment),
//  TypedReducer<int, DecrementCounterAction>(_decrement),
]);

final Reducer<String> userStateReducer = combineReducers<String>([
  TypedReducer<String, UpdNickAction>(_updNick),
]);
