class AppState {
  final Map<int, String> pokemons;
  final String nick;
  final int counter;

  AppState({this.pokemons, this.nick, this.counter});

  factory AppState.initial() => AppState(
      pokemons: Map.unmodifiable({
        0: "Slowpoke",
        1: "Slakoth",
        2: "Gloom",
        3: "Chameleon",
        4: "Raichu",
        5: "Pidgeotto",
      }),
      nick: "",
      counter: 0);
}