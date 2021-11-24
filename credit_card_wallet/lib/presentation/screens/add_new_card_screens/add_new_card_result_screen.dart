import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/presentation/widgets/button_style_one.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AddNewCardResultScreen extends StatelessWidget {
  const AddNewCardResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _addNewCardWidget(context),
                    ButtonStyleOne(
                      buttonText: 'Back to wallet',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addNewCardWidget(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black12), borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const Expanded(
            child: FlareActor(
              'assets/flares/add_new_card_success.flr',
              animation: 'success',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Congratulations',
            style: kMediumTitleTextStyle.copyWith(color: Colors.lightGreenAccent.shade400),
          ),
          const SizedBox(height: 5),
          const Text('Your card has been added successfully'),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
