import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_card_wallet/core/themes/app_themes.dart';
import 'package:credit_card_wallet/data/repositories/card_repository.dart';
import 'package:credit_card_wallet/data/repositories/user_repository.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/logic/blocs/app_bloc_observer.dart';
import 'package:credit_card_wallet/presentation/router/app_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/blocs/card/card_bloc.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      appRouter: AppRouter(),
      userRepository: UserRepository(),
      cardRepository: CardRepository(FirebaseFirestore.instance),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  final UserRepository _userRepository;
  final CardRepository _cardRepository;

  const MyApp({
    Key? key,
    required AppRouter appRouter,
    required UserRepository userRepository,
    required CardRepository cardRepository,
  })  : _appRouter = appRouter,
        _userRepository = userRepository,
        _cardRepository = cardRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(userRepository: _userRepository),
        ),
        BlocProvider(
          create: (context) => CardBloc(cardRepository: _cardRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.appTheme,
        initialRoute: AppRouter.signIn,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
