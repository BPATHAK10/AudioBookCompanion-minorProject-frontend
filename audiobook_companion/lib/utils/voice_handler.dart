import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_azure_tts/flutter_azure_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';
import 'package:kathak/utils/constants.dart';

Map<String,dynamic> voiceData = {'gender':true,'speed':1, 'pitch':1}; //gender 1 represents male and 0 for female

Map<String, Uint8List> playlist = {};

class VoiceHandler{
  late int userId;
  late String content;
  late String title;
  final _player = AudioPlayer();
  // late AudioSuccess ttsResponse;
  late Voice femaleVoice;
  late Voice maleVoice;

  VoiceHandler(int _userId){
    userId = _userId;  
    AzureTts.init(
      subscriptionKey: "81662ce970af461690a18918d4150812", //protect this
      region: "southeastasia", //protect this.
      withLogs: true
    );
    setVoice();
  }

  setVoice() async{
     final voicesResponse =await AzureTts.getAvailableVoices() as VoicesSuccess;
    femaleVoice = voicesResponse.voices
      .where((element) =>
          element.voiceType == "Neural" && element.locale.startsWith("en-") && element.localName=="Ashley")
      .toList(growable: false)[0];
    maleVoice = voicesResponse.voices
      .where((element) =>
          element.voiceType == "Neural" && element.locale.startsWith("en-") && element.localName=="Eric")
      .toList(growable: false)[0];
  }

  setContent(String _title, String _content){
    content = _content;
    title = _title;
  }

  handleText(String text){
    
    if (text.toLowerCase()=='play'){
        speak(content);
      }
    else if (text.toLowerCase()=='stop'){
      stop();
    }
    else{
      String url = baseUrl+'question_answer';
      
      http.post(Uri.parse(url), body: json.encode({
          'question':text,
          'title':title,
          'user_id':userId,
        })
      ).then((response) {
          speak(response.body);
      });
    }
  }
  void speak(String text) async{
    TtsParams params = TtsParams(
      voice: voiceData['gender']? maleVoice:femaleVoice,
      audioFormat: AudioOutputFormat.audio16khz32kBitrateMonoMp3,
      text: text
      );
    final ttsResponse = await AzureTts.getTts(params) as AudioSuccess;
    _player.playBytes(ttsResponse.audio);
  }

  void stop(){
    _player.stop();
  }

  void pause(){

  }

  void playFrom(){

  }

  void changeVoice(){

  }
}