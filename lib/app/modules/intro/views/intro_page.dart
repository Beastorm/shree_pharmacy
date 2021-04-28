import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shree_pharmacy/app/modules/login/views/login_view.dart';


class IntroPage extends StatefulWidget {
  IntroPage({Key key}) : super(key: key);

  @override
  IntroPageState createState() => new IntroPageState();
}


class IntroPageState extends State<IntroPage> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        marginDescription: EdgeInsets.all(30),
        title: 'Consult with Doctors',
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "“The art of medicine consists of amusing the patient while nature cures the disease.”",
        styleDescription: TextStyle(
            color: Color(0xff000000), fontSize: 18.0, fontFamily: 'Raleway'),
        pathImage: 'assets/images/one.png',
      ),
    );

    slides.add(
      new Slide(
        marginDescription: EdgeInsets.all(30),
        title: "We make you happy",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "“Wherever the art of Medicine is loved, there is also a love of Humanity. ”",
        styleDescription: TextStyle(
            color: Color(0xff000000), fontSize: 18.0, fontFamily: 'Raleway'),
        pathImage: "assets/images/two.png",
      ),
    );

    slides.add(
      new Slide(
        marginDescription: EdgeInsets.all(30),
        title: "We Suggest",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "“As to diseases, make a habit of two things — to help, or at least, to do no harm.”",
        styleDescription: TextStyle(
            color: Color(0xff000000), fontSize: 18.0, fontFamily: 'Raleway'),
        pathImage: "assets/images/three.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xff07AE76),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return InkWell(
      onTap: () {
        Get.off(LoginView());
      },
      child: Icon(
        Icons.done,
        color: Color(0xff07AE76),
      ),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xff07AE76),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 100.0),
          child: ListView(
            children: <Widget>[
              // GestureDetector(
              //     child: Image.asset(
              //       'assets/images/jaataa.png',
              //       width: 80.0,
              //       height: 60.0,
              //       fit: BoxFit.contain,
              //     )),

              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 250.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      // slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xffd7eae4),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xff146549),

      // Dot indicator
      colorDot: Color(0xffd7eae4),
      sizeDot: 11.0,
      //  typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Behavior
      scrollPhysics: BouncingScrollPhysics(),

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}