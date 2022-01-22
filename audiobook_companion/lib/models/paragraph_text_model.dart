import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'paragraph_text_model.g.dart';

@HiveType(typeId: 0)
class ParagraphText extends HiveObject {
  @HiveField(0)
  String title = '';

  @HiveField(1)
  String content;

  // late final List<ParagraphText> recentTexts;
  // late final List<ParagraphText> allTexts;

  ParagraphText({
    required this.title,
    required this.content,
  });
  // List<ParagraphText> getRecentTexts() {
  //   return recentTexts;
  // }

  // List<ParagraphText> getAllTexts() {
  //   return allTexts;
  // }

  // duplicate add is possible (needs some work here)
  void addToAll() {
    allTexts.add(this);
  }

  void addToRecent() {
    recentTexts.add(this);
  }
}

final List<ParagraphText> recentTexts = [
  ParagraphText(title: 'Banana', content: 'it is a fruit'),
];

final List<ParagraphText> allTexts = [
  ParagraphText(title: 'lappy', content: 'it is everything'),
];
