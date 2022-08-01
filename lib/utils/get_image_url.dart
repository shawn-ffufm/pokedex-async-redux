import 'package:pokedex/utils/constant.dart' as k;

String getImageUrl(int index) {
  index += 1;
  return k.imageURL.replaceAll(k.index, index.toString());
}
