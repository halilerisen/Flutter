import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/core/themes/app_themes.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/logic/blocs/card/card_bloc.dart';
import 'package:credit_card_wallet/presentation/router/app_router.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/credit_card_local.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cardIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(LoadCreditCards());
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _heightRate = 0.30;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppThemes.kColorPrimary,
        leading: const Icon(
          Icons.verified_user,
          color: Colors.lightGreenAccent,
        ),
        title: const Center(child: Text('Credit Card Wallet')),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await context.read<AuthenticationCubit>().logout();
              context.read<CardBloc>().emit(CardsLoaded(creditCards: []));
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRouter.signIn);
            },
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          //Box-1
          Positioned(
            top: 0.0,
            left: 0.0,
            height: _size.height * _heightRate,
            width: _size.width,
            child: Container(decoration: const BoxDecoration(color: AppThemes.kColorPrimary)),
          ),
          //CardName-Title
          Positioned(
            top: _size.height * 0.01,
            left: 30,
            child: Text('Card Name', style: kSmallTextStyle.copyWith(color: Colors.grey.shade400)),
          ),
          //Card Name
          BlocBuilder<CardBloc, CardState>(
            builder: (context, state) {
              if (state is CardsLoaded) {
                return Positioned(
                  top: _size.height * 0.05,
                  left: 30,
                  child: Text(state.creditCards.isEmpty ? '' : state.creditCards[cardIndex].cardName, style: kMediumTitleTextStyle),
                );
              } else if (state is CardsLoading) {
                return const Text('');
              }
              return const Text('');
            },
          ),
          //Box-2
          // //? Credit Cards
          Positioned(
            top: (_size.height * _heightRate) / 2,
            left: 0.0,
            height: _size.width / 2,
            width: _size.width,
            child: BlocBuilder<CardBloc, CardState>(
              builder: (context, state) {
                if (state is CardsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CardsLoaded) {
                  List<CreditCardLocal> _creditCards = state.creditCards;

                  List<Widget> _creditCardList = [
                    for (var i = 0; i < _creditCards.length; i++)
                      _creditCardWidget(
                        context,
                        creditCard: _creditCards[i],
                        height: _size.height,
                        width: _size.width,
                      ),
                  ];

                  return PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.creditCards.length,
                    clipBehavior: Clip.none,
                    onPageChanged: (index) {
                      setState(() {
                        cardIndex = index;
                      });
                    },
                    itemBuilder: (_, index) {
                      return Builder(builder: (context) {
                        return _creditCardList[index % _creditCardList.length];
                      });
                    },
                  );
                }

                return const Text('Something went wrong');
              },
            ),
          ),
          //Smooth Page Indicator
          Positioned(
            top: (_size.height * _heightRate * 1.5),
            child: BlocBuilder<CardBloc, CardState>(
              builder: (context, state) {
                if (state is CardsLoading) {
                  return const Text('');
                } else if (state is CardsLoaded) {
                  return SizedBox(
                    width: _size.width,
                    child: state.creditCards.length < 2
                        ? null
                        : Center(
                            child: AnimatedSmoothIndicator(
                              // controller: _pageController,
                              count: state.creditCards.length,
                              axisDirection: Axis.horizontal,
                              effect: const ExpandingDotsEffect(),
                              activeIndex: cardIndex,
                            ),
                          ),
                  );
                }
                return const Text('...');
              },
            ),
          ),
          //Add New Card
          Positioned(
            top: _size.height * _heightRate * 2,
            height: _size.height * 0.20,
            left: 0.0,
            width: _size.width,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'addNewCard');
              },
              child: _addNewCardWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addNewCardWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black12), borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_moderator_rounded, size: 48, color: Colors.black38),
            Text('Add New Card', style: kMediumTitleTextStyle.copyWith(color: Colors.black54, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _creditCardWidget(
    BuildContext context, {
    required CreditCardLocal creditCard,
    required double width,
    required double height,
  }) {
    return GestureDetector(
      onLongPress: () {
        context.read<CardBloc>().add(RemoveCreditCard(creditCard: creditCard));
      },
      child: CustomCreditCard(
        onTap: () {
          setState(() => creditCard.showBackSide = !creditCard.showBackSide);
        },
        cardNumber: creditCard.cardNumber,
        validTill: creditCard.validTill,
        cardHolderName: creditCard.cardHolderName,
        cvvCode: creditCard.cvv,
        cardName: creditCard.cardName,
        showBackSide: creditCard.showBackSide,
        frontBackground: Container(
          color: Color(creditCard.color),
        ),
      ),
    );
  }
}
