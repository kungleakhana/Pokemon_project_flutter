class PokemonModel {
  String? name;
  String? id;
  String? imageurl;
  String? xdescription;
  String? ydescription;
  String? height;
  String? category;
  String? weight;
  List<String>? typeofpokemon;
  List<String>? weaknesses;
  List<String>? evolutions;
  List<String>? abilities;
  int? hp;
  int? attack;
  int? defense;
  int? specialAttack;
  int? specialDefense;
  int? speed;
  int? total;
  String? malePercentage;
  String? femalePercentage;
  int? genderless;
  String? cycles;
  String? eggGroups;
  String? evolvedfrom;
  String? reason;
  String? baseExp;

  PokemonModel(
      {this.name,
      this.id,
      this.imageurl,
      this.xdescription,
      this.ydescription,
      this.height,
      this.category,
      this.weight,
      this.typeofpokemon,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.total,
      this.malePercentage,
      this.femalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedfrom,
      this.reason,
      this.baseExp});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    ydescription = json['ydescription'];
    height = json['height'];
    category = json['category'];
    weight = json['weight'];
    typeofpokemon = json['typeofpokemon'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    evolutions = json['evolutions'].cast<String>();
    abilities = json['abilities'].cast<String>();
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    specialAttack = json['special_attack'];
    specialDefense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    malePercentage = json['male_percentage'];
    femalePercentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    eggGroups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    baseExp = json['base_exp'];
  }
}
