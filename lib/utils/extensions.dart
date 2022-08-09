import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

extension ModifyUrl on String {
  String get toModifyUrl => k.imageURL.replaceAll(str.indexReplace, split('/')[6]);
}
