import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_recognition_project/data.dart';
import 'capture.dart';

void main()  {
  runApp(Slider());
}

class Slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart i",
        debugShowCheckedModeBanner: false,
        home: _Slider(),

    );
  }
}


class _Slider extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<_Slider> {

  List <SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController();

  @override
  void initState(){
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index){
            return SliderTitle(
              imageAssetPath: slides[index].getImageAssetPath(),
              title: slides[index].getTitle(),
              desc: slides[index].getDesc(),
            );
          }),
      bottomSheet: currentIndex != slides.length - 1 ? Container(
        height: Platform.isIOS ? 70 : 60,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                pageController.animateToPage(slides.length - 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
              },
                child: Text('Skip')),
            Row(
              children:<Widget> [
                for(int i=0; i<slides.length; i++ )
                  currentIndex == i ? pageIndexIndicator(true) :
                      pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
                onTap: (){
                  pageController.animateToPage(currentIndex + 1,
                      duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text('Next')),
          ],
        ),
      ) : Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        height: Platform.isIOS ? 70 : 60,
        child: InkWell(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyApp()));
          },
          child: Text("Get Started",
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}


class SliderTitle extends StatelessWidget {

  String imageAssetPath , title, desc;
  SliderTitle({this.imageAssetPath, this.title, this.desc} );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Image.asset(imageAssetPath),
          SizedBox(height: 20,),
          Text(title,
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.w500),),
          SizedBox(height: 12,),
          Text(desc,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
        ],
      ),
    );
  }
}
