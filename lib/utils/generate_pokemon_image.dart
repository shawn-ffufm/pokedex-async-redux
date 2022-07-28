import 'package:pokedex/utils/constant.dart' as k;

String generateImage(int index) {
  index += 1;
  return k.imageURL.replaceAll(k.index, index.toString());
}
