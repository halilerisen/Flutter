enum QuantityKind {
  kilogram,
  gram,
  package,
  pair,
  litre,
  millilitre,
  piece,
  meter,
  centimeter,
}

class QuantityKindClass {
  static const Map<QuantityKind, String> _quantityKindLongNameList = {
    QuantityKind.kilogram: 'Kilogram',
    QuantityKind.gram: 'Gram',
    QuantityKind.package: 'Package',
    QuantityKind.pair: 'Pair',
    QuantityKind.litre: 'Litre',
    QuantityKind.millilitre: 'Millilitre',
    QuantityKind.piece: 'Piece',
    QuantityKind.meter: 'Meter',
    QuantityKind.centimeter: 'Centimeter',
  };
  static const Map<QuantityKind, String> _quantityKindShortNameList = {
    QuantityKind.kilogram: 'Kg',
    QuantityKind.gram: 'gr',
    QuantityKind.package: 'Pa',
    QuantityKind.pair: 'Pr',
    QuantityKind.litre: 'L',
    QuantityKind.millilitre: 'ml',
    QuantityKind.piece: 'Pe',
    QuantityKind.meter: 'm',
    QuantityKind.centimeter: 'cm',
  };

  static Map<QuantityKind, String> get quantityKindLongNameList =>
      Map.unmodifiable(_quantityKindLongNameList);

  static Map<QuantityKind, String> get quantityKindShortNameList =>
      Map.unmodifiable(_quantityKindShortNameList);

  static QuantityKind getLongKey(String value) {
    if (value == null) return null;
    return _quantityKindLongNameList.keys
        .firstWhere((element) => _quantityKindLongNameList[element] == value);
  }

  static QuantityKind getShortKey(String value) {
    if (value == null) return null;
    return _quantityKindShortNameList.keys
        .firstWhere((element) => _quantityKindShortNameList[element] == value);
  }
}
