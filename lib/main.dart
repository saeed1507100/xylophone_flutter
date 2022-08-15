import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Xylophone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  // This Method plays a sound note whenever a button is pressed.
  void playSound(int noteNumber) {
      final assetsAudioPlayer = AssetsAudioPlayer();
      assetsAudioPlayer.open(
        Audio("assets/assets_note$noteNumber.wav"),
      );
  }

  // This Method returns a Expanded widget containing a button that
  // is of selected color & plays the selected sound note
  Expanded getButton(Color color, int noteNumber) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0 , vertical: 5.0),
        color: color,
        child: TextButton(
          onPressed: () {
            playSound(noteNumber);
          }, child: Container(),
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getButton(Colors.blueGrey, 1),
              getButton(Colors.white, 2),
              getButton(Colors.blueGrey, 3),
              getButton(Colors.white, 4),
              getButton(Colors.blueGrey, 5),
              getButton(Colors.white, 6),
              getButton(Colors.blueGrey, 7),
            ],
          ),
        ),
      ),
    );
  }
}
