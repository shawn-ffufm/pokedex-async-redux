import 'package:pokedex/utils/strings.dart' as str;
import 'package:pokedex/utils/constant.dart' as k;

extension GetImage on String {
  String getImage() => k.imageURL.replaceAll(str.indexReplace, split('/')[6]);
}
