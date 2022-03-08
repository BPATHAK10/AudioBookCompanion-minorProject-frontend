import 'dart:io';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:file_picker/file_picker.dart';
import 'package:kathak/utils/session_data.dart';
import 'package:kathak/utils/voice_handler.dart';
import 'package:avatar_glow/avatar_glow.dart';

class ContentScreen extends StatefulWidget {
  final int indexData;
  final Session session;
  const ContentScreen(
      {Key? key, required this.indexData, required this.session})
      : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  bool isEdit = false;
  late Data data;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late VoiceHandler _voiceHandler;
  // late PersistentBottomSheetController _controller;

  late String contentOfFile;
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  // final ValueNotifier<Map> questionAnswer = ValueNotifier({
  //   'question': 'this is question',
  //   'answer': 'this is answer',
  // });

  final ValueNotifier<String> _text = ValueNotifier<String>('start speaking');
  final ValueNotifier<String> answer = ValueNotifier<String>('');
  // String answer = '';

  final _scaffoldKey = GlobalKey<ScaffoldState>(); //key for context
  @override
  void initState() {
    super.initState();
    _voiceHandler = VoiceHandler(widget.session.userId);
    if (widget.indexData >= widget.session.allTexts.length) {
      data = Data('', '', '', -1);
      isEdit = true;
      _titleController.text = '';
      _descriptionController.text = '';
    } else {
      data = widget.session.allTexts[widget.indexData];
      _titleController.text = data.title;
      _descriptionController.text = data.content;
      _voiceHandler.setContent(data.textId, data.content);
    }
  }

  @override
  void dispose() {
    _text.dispose();
    answer.dispose();
    super.dispose();
    _voiceHandler.stop();
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    print(_text.value);
    print(answer.value);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          ((_descriptionController.text == ''))
              ? IconButton(
                  icon: const Icon(Icons.upload_file),
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['txt'],
                    );
                    if (result != null) {
                      File file = File(result.files.single.path.toString());
                      final fileContents = file.readAsStringSync();
                      data.content = fileContents.toString();
                      _descriptionController.text = fileContents.toString();
                    }
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _descriptionController.text = '';
                      isEdit = true;
                      data.content = '';
                    });
                  },
                ),
          isEdit
              ? IconButton(
                  icon: const Icon(Icons.check_circle_outline_outlined),
                  onPressed: () async {
                    if (data.textId >= 0) {
                      if (data.content == '' && data.title == '') {
                        widget.session.deleteData(data.textId);
                        data.textId = -1;
                        isEdit = true;
                      } else {
                        widget.session.deleteData(data.textId);
                        final textid = await widget.session
                            .addData(data.title, data.content, data.date);
                        data.textId = textid;
                        isEdit = false;
                      }
                    } else {
                      if (data.content != '' || data.title != '') {
                        final dm = DateTime.now().month.toString() +
                            ':' +
                            DateTime.now().day.toString();
                        final time = DateTime.now().hour.toString() +
                            ':' +
                            DateTime.now().minute.toString();
                        final date = time + ' ' + dm;
                        final int textid = await widget.session
                            .addData(data.title, data.content, date);
                        data.textId = textid;
                        isEdit = false;
                      }
                    }
                    _voiceHandler.setContent(data.textId, data.content);
                    FocusManager.instance.primaryFocus?.unfocus();
                    setState(() {});
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () async {
                    if (data.textId >= 0) {
                      widget.session.deleteItem(widget.indexData);
                    }
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: (!isEdit && !_isListening)
          ? AvatarGlow(
              animate: _isListening,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 75.0,
              duration: const Duration(milliseconds: 1000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: FloatingActionButton(
                // onPressed: _listen,
                onPressed: () => _showModalBottomSheet(),
                child: Icon(_isListening ? Icons.mic : Icons.mic_none),
              ),
            )
          : null,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
            child: Column(
              children: [
                TextField(
                  onTap: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  onChanged: (text) {
                    data.title = text;
                  },
                  controller: _titleController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Title'),
                ),
                TextField(
                  onTap: () {
                    setState(() {
                      isEdit = true;
                    });
                  },
                  onChanged: (text) {
                    data.content = text;
                    setState(() {
                      isEdit = true;
                    });
                  },
                  maxLines: 20,
                  controller: _descriptionController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    height: 1.5,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Start Wrting Text',
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _voiceHandler.pause();
        _speech.listen(
          onResult: (val) => setState(() {
            _text.value = val.recognizedWords;
          }),
        );
        // _showModalBottomSheet(_text);
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      var ans = await _voiceHandler.handleText(_text.value);
      // print('helloooooo');
      // print(ans);
      setState(() {
        answer.value = ans;
      });
      // });
    }
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => ValueListenableBuilder(
            valueListenable: _text,
            builder: (context, value, child) {
              // final text = value.data;
              return ValueListenableBuilder(
                valueListenable: answer,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text(_text.value),
                        // onTap: (){
                        //   _listen();
                        //   Navigator.pop(context);
                        // },
                      ),
                      ListTile(
                        title: Text(answer.value),
                      ),
                      ListTile(
                        leading: Icon(Icons.mic),
                        title: Text('Listen'),
                        onTap: _listen,
                      )
                    ],
                  );
                },
              );
            }));
  }
}
