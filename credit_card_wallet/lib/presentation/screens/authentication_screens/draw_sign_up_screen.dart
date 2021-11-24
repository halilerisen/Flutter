import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/presentation/widgets/button_style_authentication.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_authentication_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawSignUpScreen extends StatelessWidget {
  const DrawSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    final TextEditingController _emailTextEditingController = TextEditingController();
    final TextEditingController _passwordTextEditingController = TextEditingController();

    return Scaffold(
      body: SizedBox(
        width: _size.width,
        height: _size.height,
        child: Stack(
          children: [
            //? Blue
            ClipPath(
              clipper: MyClipper2(),
              child: Container(
                width: _size.width,
                height: _size.height * 0.90,
                color: Colors.lightBlueAccent,
              ),
            ),
            //? Orange
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: _size.width,
                height: _size.height * 0.50,
                color: Colors.orangeAccent.shade100,
              ),
            ),
            //? Create Account Title
            Positioned(
              top: _size.height * 0.18,
              left: _size.width * 0.04,
              child: Text('Create Account', style: kMediumTitleTextStyle),
            ),
            //? Authentication Inputs
            KeyboardVisibilityBuilder(
              builder: (BuildContext context, bool isKeyboardVisible) {
                return Positioned(
                  // top: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom : _size.height * 0.55,
                  left: _size.width * 0.08,
                  bottom: isKeyboardVisible ? MediaQuery.of(context).viewInsets.bottom + _size.height * 0.05 : _size.height * 0.20,
                  width: _size.width * 0.84,
                  child: Column(
                    children: [
                      //? Email Input
                      CustomAuthenticationTextInput(
                        textEditingController: _emailTextEditingController,
                        textInputType: TextInputType.emailAddress,
                        hintText: 'Email',
                        hintTextColor: Colors.white70,
                      ),
                      //? Password Input
                      CustomAuthenticationTextInput(
                        textEditingController: _passwordTextEditingController,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        hintText: 'Password',
                        hintTextColor: Colors.white70,
                      ),
                      //? Row
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sign up', style: kSmallTextStyle.copyWith(fontSize: 24)),
                          ButtonStyleAuthentication(
                            onPressed: () {
                              context.read<AuthenticationCubit>().register(
                                    email: _emailTextEditingController.text,
                                    password: _passwordTextEditingController.text,
                                  );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.60);

    path.quadraticBezierTo(
      size.width * 0.50,
      size.height,
      size.width,
      size.height * 0.80,
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

    path.lineTo(0, size.height * 0.90);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width,
      size.height * 0.80,
    );

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
