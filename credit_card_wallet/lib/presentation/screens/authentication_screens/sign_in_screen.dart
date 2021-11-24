import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/core/themes/app_themes.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_authentication_text_input.dart';
import 'package:credit_card_wallet/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'draw_sign_in_screen.dart';
import 'draw_sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with TickerProviderStateMixin {
  final TextEditingController _emailTextEditingController = TextEditingController();

  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 2, vsync: this);

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoggedIn) {
          Navigator.pop(context);
          Navigator.pushNamed(context, 'home');
        }
      },
      builder: (context, state) {
        if (state is AuthenticationInitial || state is AuthenticationLoggedOut) {
          return Scaffold(
            body: Stack(
              children: [
                TabBarView(
                  controller: _tabController,
                  children: const [
                    DrawSignInScreen(),
                    DrawSignUpScreen(),
                  ],
                ),
                Positioned(
                  right: 0,
                  top: _size.height * 0.05,
                  height: 50,
                  width: _size.width * 0.40,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white.withOpacity(0.7),
                    tabs: const [
                      Text('Sign In'),
                      Text('SignUp'),
                    ],
                    // children: [],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


/*

Scaffold(
            backgroundColor: AppThemes.kLoginBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Log In',
                    textAlign: TextAlign.center,
                    style: kLoginTextStyle,
                  ),
                  const SizedBox(height: 50),
                  CustomTextInput(
                    hintText: 'Email',
                    textEditingController: _emailTextEditingController,
                    textInputType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  CustomTextInput(
                    hintText: 'Password',
                    textEditingController: _passwordTextEditingController,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  LoginButton(
                    buttonText: 'LOG IN',
                    buttonColor: AppThemes.kLoginButtonBackgroundColor,
                    buttonTextColor: Colors.white,
                    onPress: () async {
                      await context.read<AuthenticationCubit>().login(email: _emailTextEditingController.text, password: _passwordTextEditingController.text);
                    },
                  ),
                  const SizedBox(height: 10),
                  LoginButton(
                    buttonText: 'Sing Up',
                    buttonColor: AppThemes.kSingUpButtonBackgroundColor,
                    buttonTextColor: Colors.black,
                    onPress: () {
                      Navigator.pushNamed(context, 'signUp');
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'resetPassword');
                    },
                  ),
                ],
              ),
            ),
          )

*/