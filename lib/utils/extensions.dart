import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

extension StringManipulation on String {
  String get toCustomUrl => k.imageURL.replaceAll(str.indexReplace, split('/')[6]);
}

extension IntManipulation on String {
  int get getPokemonId => int.parse(split('/')[6]);
}
