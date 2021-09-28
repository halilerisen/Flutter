import 'package:flutter/cupertino.dart';
import 'package:haloagenda/constans.dart';

enum ShoppingPriceKind {
  turkishLira,
  euro,
  dollar,
}

class ShoppingPriceKindClass {
  static const Map<ShoppingPriceKind, String> _shoppingPriceKindLongNameList = {
    ShoppingPriceKind.turkishLira: 'Turkish Lira',
    ShoppingPriceKind.euro: 'Euro',
    ShoppingPriceKind.dollar: 'Dollar',
  };
  static const Map<ShoppingPriceKind, String> _shoppingPriceKindShortNameList =
      {
    ShoppingPriceKind.turkishLira: 'TL',
    ShoppingPriceKind.euro: 'EUR',
    ShoppingPriceKind.dollar: 'USD',
  };

  static const Map<ShoppingPriceKind, Icon> _shoppingPriceKindIconList = {
    ShoppingPriceKind.turkishLira: kTurkishLiraIcon,
    ShoppingPriceKind.euro: kEuroIcon,
    ShoppingPriceKind.dollar: kDolarIcon,
  };

  static Map<ShoppingPriceKind, String> get shoppingPriceKindLongNameList =>
      Map.unmodifiable(_shoppingPriceKindLongNameList);

  static Map<ShoppingPriceKind, String> get shoppingPriceKindShortNameList =>
      Map.unmodifiable(_shoppingPriceKindShortNameList);

  static Map<ShoppingPriceKind, Icon> get shoppingPriceKindIconList =>
      Map.unmodifiable(_shoppingPriceKindIconList);

  static ShoppingPriceKind getLongKey(String value) {
    if (value == null) return null;
    return _shoppingPriceKindLongNameList.keys.firstWhere(
        (element) => _shoppingPriceKindLongNameList[element] == value);
  }

  static ShoppingPriceKind getShortKey(String value) {
    if (value == null) return null;
    return _shoppingPriceKindShortNameList.keys.firstWhere(
        (element) => _shoppingPriceKindShortNameList[element] == value);
  }
}
