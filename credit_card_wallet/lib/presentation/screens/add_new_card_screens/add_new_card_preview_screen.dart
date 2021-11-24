import 'package:credit_card_wallet/core/constants.dart';
import 'package:credit_card_wallet/data/models/credit_card_local.dart';
import 'package:credit_card_wallet/logic/blocs/card/card_bloc.dart';
import 'package:credit_card_wallet/presentation/router/app_router.dart';
import 'package:credit_card_wallet/presentation/widgets/button_style_one.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_credit_card.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardPreviewScreen extends StatefulWidget {
  const AddNewCardPreviewScreen({
    Key? key,
    required this.creditCard,
  }) : super(key: key);

  final CreditCardLocal creditCard;

  @override
  _AddNewCardPreviewScreenState createState() => _AddNewCardPreviewScreenState();
}

class _AddNewCardPreviewScreenState extends State<AddNewCardPreviewScreen> {
  //? Card Name
  final TextEditingController _cardNameEditingController = TextEditingController();
  final FocusNode _cardNameFocusNode = FocusNode();
  final _cardNameMaskFormatter = MaskTextInputFormatter(mask: '', filter: {"": RegExp(r'[a-zA-Z]')});
  final GlobalKey<FormState> _cardNameFormKey = GlobalKey<FormState>();

  Color pickerColor = Colors.cyan;
  bool showBackSide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 25),
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //? Credit Card
                _buildCreditCard(),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //? Card Name
                      Form(key: _cardNameFormKey, child: _buildCardNameFormField(context)),
                      //? Pick Color Button
                      ElevatedButton(
                        child: const Text('Pick Card Color'),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(widget.creditCard.color))),
                        onPressed: () {
                          _pickColor(context);
                        },
                      ),
                      //? Add Card Button
                      ButtonStyleOne(
                        buttonText: 'Add card',
                        onPressed: () {
                          if (_cardNameFormKey.currentState!.validate()) {
                            _cardNameFormKey.currentState!.save();
                            context.read<CardBloc>().add(AddNewCreditCard(creditCard: widget.creditCard));
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pushNamed(context, AppRouter.addNewCardResult);
                          }
                        },
                      ),
                      const SizedBox(height: 5.0),
                      //? cancel Button
                      ButtonStyleOne(
                        buttonText: 'cancel',
                        buttonColor: Colors.white,
                        buttonTextColor: Colors.black87,
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditCard() {
    return CustomCreditCard(
      onTap: () {
        setState(() => showBackSide = !showBackSide);
      },
      cardNumber: widget.creditCard.cardNumber,
      validTill: widget.creditCard.validTill,
      cardHolderName: widget.creditCard.cardHolderName,
      cvvCode: widget.creditCard.cvv,
      cardName: widget.creditCard.cardName,
      showBackSide: showBackSide,
      frontBackground: Container(color: Color(widget.creditCard.color)),
    );
  }

  _pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pick Color'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildColorPicker(),
                TextButton(
                  child: const Text('Select'),
                  onPressed: () {
                    Navigator.pop(context);

                    setState(() => widget.creditCard.color = pickerColor.value);
                  },
                ),
              ],
            ),
          ),
        ),
      );

  _buildColorPicker() => BlockPicker(
        pickerColor: pickerColor,
        // availableColors: _colorList,
        onColorChanged: (Color color) {
          setState(() => pickerColor = color);
        },
      );

  CustomFormTextField _buildCardNameFormField(BuildContext context) {
    return CustomFormTextField(
      textInputType: TextInputType.name,
      textEditingController: _cardNameEditingController,
      focusNode: _cardNameFocusNode,
      labelText: 'Card Name',
      hintText: 'Master Credit Card,...',
      radius: 10,
      maxLength: 25,
      inputFormatters: [_cardNameMaskFormatter],
      onChanged: (value) {
        setState(() {
          widget.creditCard.cardName = value;
        });
      },
      onSaved: () {
        if (_cardNameFormKey.currentState!.validate()) {
          _cardNameFormKey.currentState!.save();
          _cardNameFocusNode.unfocus();
        } else {
          return;
        }
      },
      validator: (String? value) {
        if (value.toString().length < 3) {
          return 'Minimum length 3';
        }
        return null;
      },
    );
  }
}
