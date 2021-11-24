import 'package:awesome_card/awesome_card.dart';
import 'package:awesome_card/credit_card.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_wallet/data/models/credit_card_local.dart';
import 'package:credit_card_wallet/logic/Cubit/authentication/authentication_cubit.dart';
import 'package:credit_card_wallet/presentation/screens/add_new_card_screens/add_new_card_preview_screen.dart';
import 'package:credit_card_wallet/presentation/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  //? Card HolderName
  final TextEditingController _cardHolderNameEditingController = TextEditingController();
  final FocusNode _cardHolderNameFocusNode = FocusNode();
  final _cardHolderNameMaskFormatter = MaskTextInputFormatter(mask: '', filter: {"": RegExp(r'[a-zA-Z]')});
  final GlobalKey<FormState> _cardHolderNameFormKey = GlobalKey<FormState>();
  bool _visibilityCardHolderNameForm = true;

  //? Card Number
  final TextEditingController _cardNumberEditingController = TextEditingController();
  final FocusNode _cardNumberFocusNode = FocusNode();
  final GlobalKey<FormState> _cardNumberFormKey = GlobalKey<FormState>();
  bool _visibilityCardNumberForm = false;

  //? Valid Till
  final TextEditingController _validTillEditingController = TextEditingController();
  final FocusNode _validTillFocusNode = FocusNode();
  final _validTillMaskFormatter = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  final GlobalKey<FormState> _validTillFormKey = GlobalKey<FormState>();
  bool _visibilityValidTillForm = false;

  //? Cvv
  final TextEditingController _cvvEditingController = TextEditingController();
  final FocusNode _cvvFocusNode = FocusNode();
  final _cvvMaskFormatter = MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});
  final GlobalKey<FormState> _cvvFormKey = GlobalKey<FormState>();
  bool _visibilityCvvForm = false;

  //? Other
  final CreditCardValidator _creditCardValidator = CreditCardValidator();
  bool showBackSide = false;

  final CreditCardLocal creditCard = CreditCardLocal(
    userEmail: FirebaseAuth.instance.currentUser!.email!,
    cardName: '',
    cardHolderName: '',
    cardNumber: '',
    validTill: '',
    cvv: '',
  );

  @override
  Widget build(BuildContext context) {
    _cvvFocusNode.addListener(() {
      setState(() {
        showBackSide = _cvvFocusNode.hasFocus;
      });
    });

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCreditCard(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: _visibilityCardHolderNameForm,
                      child: Form(
                        key: _cardHolderNameFormKey,
                        child: _buildCardHolderNameFormField(context),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: _visibilityCardNumberForm,
                      child: Form(
                        key: _cardNumberFormKey,
                        child: _buildCardNumberFormField(context),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Visibility(
                          visible: _visibilityValidTillForm,
                          child: Form(
                            key: _validTillFormKey,
                            child: Expanded(child: _buildValidTillFormField(context)),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Visibility(
                          visible: _visibilityCvvForm,
                          child: Form(
                            key: _cvvFormKey,
                            child: Expanded(
                              child: _buildCVVFormField(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomFormTextField _buildCardHolderNameFormField(BuildContext context) {
    return CustomFormTextField(
      textInputType: TextInputType.name,
      textEditingController: _cardHolderNameEditingController,
      focusNode: _cardHolderNameFocusNode,
      labelText: 'Card Holder Name',
      hintText: 'Mike JAMES',
      radius: 10,
      maxLength: 20,
      inputFormatters: [_cardHolderNameMaskFormatter],
      onChanged: (value) {
        setState(() {
          creditCard.cardHolderName = value;
        });
      },
      onSaved: () {
        if (_cardHolderNameFormKey.currentState!.validate()) {
          _cardHolderNameFormKey.currentState!.save();
          setState(() {
            _visibilityCardHolderNameForm = false;
            _visibilityCardNumberForm = true;
            _cardHolderNameFocusNode.unfocus();
            _cardNumberFocusNode.requestFocus();
          });
        } else {
          return;
        }
      },
      validator: (String? value) {
        if (value.toString().isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  CustomFormTextField _buildCardNumberFormField(BuildContext context) {
    return CustomFormTextField(
      textInputType: TextInputType.number,
      textEditingController: _cardNumberEditingController,
      maxLength: 19,
      labelText: 'Card Number',
      hintText: '1111 1111 1111 1111',
      radius: 10,
      focusNode: _cardNumberFocusNode,
      inputFormatters: [CreditCardFormatter()],
      onChanged: (value) {
        setState(() {
          creditCard.cardNumber = value;
        });
      },
      onSaved: () {
        if (_cardNumberFormKey.currentState!.validate()) {
          _cardNumberFormKey.currentState!.save();
          setState(() {
            _visibilityCardNumberForm = false;
            _visibilityValidTillForm = true;
            _visibilityCvvForm = true;
            _cardNumberFocusNode.unfocus();
            _validTillFocusNode.requestFocus();
          });
        } else {
          return;
        }
      },
      validator: (String? value) {
        var checkResult = _creditCardValidator.validateCCNum(value.toString().trim());
        if (!checkResult.isValid || value.toString().isEmpty) {
          return checkResult.message;
        }
        return null;
      },
    );
  }

  CustomFormTextField _buildValidTillFormField(BuildContext context) {
    return CustomFormTextField(
      textInputType: TextInputType.number,
      textEditingController: _validTillEditingController,
      focusNode: _validTillFocusNode,
      labelText: 'Valid Till',
      hintText: 'MM/YY',
      radius: 10,
      maxLength: 5,
      inputFormatters: [_validTillMaskFormatter],
      onChanged: (value) {
        setState(() {
          creditCard.validTill = value;
        });
      },
      onSaved: () {
        if (_validTillFormKey.currentState!.validate()) {
          _validTillFormKey.currentState!.save();

          _validTillFocusNode.unfocus();
          _cvvFocusNode.requestFocus();
        } else {
          return;
        }
      },
      validator: (String? value) {
        var checkResult = _creditCardValidator.validateExpDate(value.toString().trim());
        if (!checkResult.isValid || value.toString().isEmpty) {
          return checkResult.message;
        }
        return null;
      },
    );
  }

  CustomFormTextField _buildCVVFormField(BuildContext context) {
    return CustomFormTextField(
      textInputType: TextInputType.number,
      textEditingController: _cvvEditingController,
      focusNode: _cvvFocusNode,
      maxLength: 3,
      labelText: 'CVV',
      hintText: 'xxx',
      radius: 10,
      inputFormatters: [_cvvMaskFormatter],
      onChanged: (value) {
        setState(() {
          creditCard.cvv = value;
        });
      },
      onSaved: () {
        if (_cvvFormKey.currentState!.validate()) {
          _cvvFormKey.currentState!.save();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewCardPreviewScreen(
                creditCard: creditCard,
              ),
            ),
          );
        } else {
          return;
        }
      },
      validator: (String? value) {
        var checkResult =
            _creditCardValidator.validateCVV(value.toString().trim(), _creditCardValidator.validateCCNum(_cardNumberEditingController.text).ccType);
        if (!checkResult.isValid || value.toString().isEmpty) {
          return checkResult.message;
        }
        return null;
      },
    );
  }

  Widget _buildCreditCard() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showBackSide = !showBackSide;
        });
      },
      child: CreditCard(
        cardHolderName: creditCard.cardHolderName,
        cardNumber: creditCard.cardNumber,
        cardExpiry: creditCard.validTill,
        cvv: creditCard.cvv,
        textName: 'Name',
        bankName: "Axis Bank",
        showBackSide: showBackSide,
        frontBackground: Container(color: Color(creditCard.color)),
        backBackground: CardBackgrounds.white,
        showShadow: true,
        textExpDate: 'Exp. Date',
        textExpiry: 'MM/YY',
      ),
    );
  }
}
