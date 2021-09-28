import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//1-TickerProviderStateMixin 'with' anahtar kelimesi ile miras alma
class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  //2-AnimationControler oluşturma
  late AnimationController controller;
  //8- Animation oluşturma
  late Animation animation;

  //3-initState oluştur
  @override
  void initState() {
    super.initState();
    //4-controller tanımını yapma
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    //Tween 13- animation tanımlama
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    //9-animaton tanımını yapma
    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.decelerate,
    // );

    //5-Animasyon başlatma
    controller.forward();

    //10-animation.addStatusListerner
    // animation.addStatusListener(
    //   (status) {
    //     //11-Animasyonu sonsuz döngüye sokma
    //     if (status == AnimationStatus.completed) {
    //       controller.reverse(from: 1);
    //     } else if (status == AnimationStatus.dismissed) {
    //       controller.forward();
    //     }
    //   },
    // );

    //9-Değeri azaltır, forward'ın tersini yapar.
    // controller.reverse(from: 1);

    //6-controller.value dinleme
    controller.addListener(() {
      //7-setState ekleme
      setState(() {});
    });
  }

  //12- Ekran kapatılırsa animasyon kaynaklarını serbest bırakma
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
