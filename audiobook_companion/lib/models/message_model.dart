import './user_model.dart';

class Message {
  final User text_title;
  final String avatar;
  final String text;

  Message({
    required this.text_title,
    required this.avatar,
    required this.text,
  });
}

final List<Message> recentChats = [
  Message(
    text_title: blackhole,
    avatar: 'assets/images/blackhole.jpg',
    text: "What a blackhole is?",
 
  ),
  Message(
    text_title: ai,
    avatar: 'assets/images/ai.jpg',
    text: "Will ai take over the world ?",

   
  ),
];

final List<Message> allChats = [
  Message(
    text_title: elon,
    avatar: 'assets/images/elon.jpg',
    text: "Will elon take doge to the moon?",

  ),
  Message(
    text_title: pandas,
    avatar: 'assets/images/panda.jpg',
    text: "Where do panda live?",

  ),
  
];

