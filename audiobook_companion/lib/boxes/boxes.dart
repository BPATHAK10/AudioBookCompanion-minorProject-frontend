import 'package:audiobook_companion/models/paragraph_text_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes{
  static Box<ParagraphText> getTexts() =>
    Hive.box<ParagraphText>('paragraph_text');
}