import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Display extends StatefulWidget {
  final String text;
  Display(this.text);
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  final FlutterTts flutterTts = FlutterTts();
  
  @override
  Widget build(BuildContext context) {

    Future speak() async{
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      await flutterTts.speak(widget.text);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Smart i', ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 50),
                  margin: EdgeInsets.all(20),
                  child: Text(widget.text,
                  style: TextStyle(fontSize: 20))
              ),

              SizedBox(height: 40,),

              MaterialButton(
                height: 50,
                color: Colors.black,
                onPressed:() => speak(),
                child: Text('Speak',
                style: TextStyle(color: Colors.white,fontSize: 20),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              )),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
