import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class Data{
  late String title;
  late String content;
  late int textId;

  Data(
    this.title, 
    this.content,
    this.textId,
  );
}

class Session{

  late int userId;
  late String userName;
  late String passWord;
  late List<Data> allTexts;

  Session(){
    allTexts = [];
  }

  Future<int> addData(String title, String content) async{

    late int textid;
    await http.post(addUrl, body: json.encode({
      'title':title,
      'content':content,
      'user_id':userId
    })
    ).then((response){
      print ('I am inside');
      textid = int.parse(response.body);
      if (response.body!="404"){
        final a = Data(title,content,textid);
        allTexts.add(a);        
      }
    }); 
    return textid;
  }

  void deleteItem(int index) async{
    final _textId = allTexts[index].textId;
    allTexts.removeAt(index);
    await http.post(delUrl, body: json.encode({
      'user_id':userId,
      'text_id':_textId,
      })
    );
  }

  void deleteData(int _textId) async{
    for (int i=0; i<allTexts.length; i++){
      if (allTexts[i].textId == _textId){
        allTexts.remove(allTexts[i]);
      }
    }
    await http.post(delUrl, body: json.encode({
      'user_id':userId,
      'text_id':_textId,
      })
    );
  }

  Future<List<Data>> getAllTexts() async {
    // final List<Data> newTexts = [];
    await http.post(getUrl, body:json.encode({
      'user_id': userId
    })).then((response){
      final decoded = json.decode(response.body) as Map<String,dynamic>;
      final newdecoded= decoded['json_list'];
      print (newdecoded.runtimeType);
      for (var i=0;i<newdecoded.length;i++){
        final p = Data(
          newdecoded[i]['title'],
          newdecoded[i]['content'],
          newdecoded[i]['text_id']
        );
        allTexts.add(p);
      }
    });
    // print (newTexts.length);
    return allTexts;
  }

  Future<bool> setUser(String username, String password) async{
    await http.post(loginUrl, body: json.encode({
      'username':username,
      'password':password
    })).then((response){
      if (response.body=="404"){
        return false;
      }
      else{
        userName = username;
        passWord = password;
        userId = int.parse(response.body); 
        return true;
      }
    });
    return false;
  }

  Future <bool> addUser(String username, String password)async {
    await http.post(registerUrl, body: json.encode({
      'username':username,
      'password':password
    })).then((response){
      if (response.body=="404"){
        return true;
      }
      else{
        return false;
      }
    });
    return false;
  }
}