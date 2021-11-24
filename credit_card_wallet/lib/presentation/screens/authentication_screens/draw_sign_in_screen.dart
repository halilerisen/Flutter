import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/presentation/widgets/button_style_authentication.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_authentication_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawSignInScreen extends StatelessWidget {
  const DrawSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final TextEditingController _emailTextEditingController = TextEditingController();
    final TextEditingController _passwordTextEditingController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: _size.width,
          height: _size.height,
          child: Stack(
            children: [
              //? Red Background
              ClipPath(
                clipper: MyClipper3(),
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.60,
                  color: Colors.redAccent.shade100,
                ),
              ),
              //? Orange Background
              ClipPath(
                clipper: MyClipper2(),
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.50,
                  color: Colors.orangeAccent.shade100,
                ),
              ),
              //?Blue Background
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.25,
                  color: Colors.lightBlueAccent,
                ),
              ),
              //? Welcome title
              Positioned(
                top: _size.height * 0.15,
                left: _size.width * 0.04,
                child: Text('Welcome', style: kMediumTitleTextStyle),
              ),
              //? Authentication Inputs
              KeyboardVisibilityBuilder(
                builder: (BuildContext context, bool isKeyboardVisible) {
                  return Positioned(
                    // top: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom : _size.height * 0.55,
                    left: _size.width * 0.08,
                    bottom: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom : _size.height * 0.17,
                    width: _size.width * 0.84,
                    child: Column(
                      children: [
                        //? Email Input
                        CustomAuthenticationTextInput(
                          textEditingController: _emailTextEditingController,
                          textInputType: TextInputType.emailAddress,
                          hintText: 'Email',
                        ),
                        //? Password Input
                        CustomAuthenticationTextInput(
                          textEditingController: _passwordTextEditingController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          hintText: 'Password',
                        ),
                        //? Row
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sign in', style: kSmallTextStyle.copyWith(color: Colors.redAccent.shade100, fontSize: 24)),
                            ButtonStyleAuthentication(
                              onPressed: () async {
                                await context.read<AuthenticationCubit>().login(
                                      email: _emailTextEditingController.text,
                                      password: _passwordTextEditingController.text,
                                    );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height * 0.8,
    );

    path.quadraticBezierTo(
      size.width - (size.width * 0.15),
      size.height * 0.50,
      size.width,
      size.height * 0.50,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height * 0.75,
    );

    path.quadraticBezierTo(
      size.width - (size.width * 0.25),
      size.height * 0.40,
      size.width,
      size.height * 0.35,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.25);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.30,
      size.width * 0.40,
      size.height * 0.40,
    );

    path.quadraticBezierTo(
      size.width - (size.width * 0.25),
      size.height * 0.75,
      size.width,
      size.height * 0.50,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
