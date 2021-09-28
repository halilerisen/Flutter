import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

//TODO : Group TextStyles
const TextStyle kGroupTitleTextStyle = TextStyle(
  fontFamily: 'SpecialElite',
  color: Colors.white,
  fontSize: 18.0,
  letterSpacing: 1,
);
const TextStyle kHomeScreenTitleTextStyle = TextStyle(
  fontFamily: 'SpecialElite',
  color: Colors.white,
  fontSize: 22.0,
  letterSpacing: 5,
);
//TODO : Notebook TextStyles
const TextStyle kNotebookDateTextStyle = TextStyle(
  fontFamily: 'SpecialElite',
  color: Color(0xFF6F6F6F),
  fontSize: 9.0,
);
const TextStyle kNotebookEditTitleTextStyle = TextStyle(
  fontFamily: 'SpecialElite',
  color: Colors.white,
  fontSize: 16.0,
);
const TextStyle kNotebookEditTextStyle = TextStyle(
  fontFamily: 'SpecialElite',
  color: Colors.white,
  fontSize: 14.0,
);
//TODO : PopupMenu TextStyles
const TextStyle kPopmenuTextStyle = TextStyle(
  color: kNotebookTextEditColor,
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 4,
);
const TextStyle kCustomPopupMenuButtonTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
);
//TODO : Shopping TextStyles
const TextStyle kShoppingTitleTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  fontFamily: 'SpecialElite',
);
const TextStyle kShoppingQuantityTextStyle = TextStyle(
  fontSize: 10.0,
  color: kNotebookTextEditColor,
);
const TextStyle kShoppingPriceTextStyle = TextStyle(
  fontSize: 10.0,
  color: Colors.green,
);

//TODO : Todo TextStyles
const TextStyle kTodoTitleTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  fontFamily: 'MarkaziText-Regular',
);
const TextStyle kTodoDescriptionTextStyle = TextStyle(
  fontSize: 8.0,
  color: kNotebookTextEditColor,
  fontFamily: 'RobotoSlab',
);

//TODO : Const Colors
const Color kAppBackgroundColor = Color(0xFF3A3A3A);
const Color kAppDeleteColor = Color(0xFFE78383);
const Color kAppPrimaryColor = Color(0xFF303030);
const Color kShoppingPrimaryColor = Color(0xFFE7B183);
const Color kShoppingPrimaryIntensiveColor = Color(0xFFF97300);
const Color kNotebookPrimaryColor = Color(0xFFDF6E21);
const Color kNotebookTextEditColor = Color(0xFFB0B0B0);
const Color kTodoPrimaryColor = Color(0xFF2096BA);
const Color kTodoPriorityHighColor = Color(0xFFFF0000);
const Color kTodoPriorityMediumColor = Color(0xFF2096BA);
const Color kTodoPriorityLowColor = Color(0xFFFAE800);
const Color kTodoPriorityDoneColor = Color(0xFF303030);

//TODO : Groups Icons

const Icon kGroupsIcon = Icon(
  Icons.format_list_bulleted,
  color: kAppPrimaryColor,
  size: 20.0,
);
const Icon kGroupsCategoryIcon = Icon(
  MaterialCommunityIcons.shape_plus,
  color: kAppPrimaryColor,
  size: 20.0,
);
const Icon kGroupAddIcon = Icon(
  MaterialCommunityIcons.playlist_plus,
  color: kAppPrimaryColor,
);

//TODO : Shopping Icons
const Icon kShoppingGroupIcon = Icon(
  Icons.shopping_cart,
  color: kShoppingPrimaryColor,
  size: 20.0,
);
final kShoppingBackgroundImage = Image.asset(
  'images/shoppingBackground.png',
);
//TODO : Notebook Icons
final kNotebookBackgroundImage = Image.asset(
  'images/notebookBackground.png',
);
const Icon kNotebookGroupIcon = Icon(
  FontAwesome.book,
  color: kNotebookPrimaryColor,
);

//TODO : Todo Icons
final kTodoBackgroundImage = Image.asset(
  'images/todoBackground.png',
);

const Icon kTodoGroupIcon = Icon(
  Octicons.tasklist,
  color: kTodoPrimaryColor,
  size: 24.0,
);

const Icon kTaskAlertIcon = Icon(
  MaterialCommunityIcons.bell_ring_outline,
  color: kTodoPriorityHighColor,
  size: 12.0,
);
const Icon kTaskRepeatOneIcon12 = Icon(
  MaterialCommunityIcons.repeat_once,
  color: kTodoPrimaryColor,
  size: 12.0,
);
const Icon kTaskRepeatUntilDateIcon12 = Icon(
  MaterialCommunityIcons.calendar_repeat,
  color: kTodoPrimaryColor,
  size: 12.0,
);
const Icon kTaskRepetitionIcon12 = Icon(
  MaterialCommunityIcons.repeat,
  color: kTodoPrimaryColor,
  size: 12.0,
);
const Icon kTaskRepetitionIcon24 = Icon(
  MaterialCommunityIcons.repeat,
  color: kTodoPrimaryColor,
  size: 24.0,
);
const Icon kTaskRepeatOneIcon24 = Icon(
  MaterialCommunityIcons.repeat_once,
  color: kTodoPrimaryColor,
  size: 20.0,
);
const Icon kTaskRepeatUntilDateIcon24 = Icon(
  MaterialCommunityIcons.calendar_repeat,
  color: kTodoPrimaryColor,
  size: 20.0,
);
const Icon kTaskDescriptionIcon = Icon(
  SimpleLineIcons.note,
  color: kTodoPrimaryColor,
  size: 20.0,
);
const Icon kTaskHourIcon = Icon(
  MaterialIcons.access_time,
  color: kTodoPrimaryColor,
  size: 20.0,
);
const Icon kTaskRepeatCountIcon = Icon(
  Icons.space_bar,
  color: kTodoPrimaryColor,
  size: 20.0,
);
const Icon kTaskDateIcon = Icon(
  MaterialCommunityIcons.calendar_repeat_outline,
  color: kTodoPrimaryColor,
  size: 20.0,
);

//TODO : Other Icons
const Icon kAppAddIcon = Icon(
  Icons.add,
  color: kAppPrimaryColor,
  size: 20.0,
);
const Icon kTurkishLiraIcon = Icon(
  FontAwesome.turkish_lira,
  color: kShoppingPrimaryIntensiveColor,
  size: 20.0,
);
const Icon kDragHandleIcon = Icon(
  Icons.drag_handle,
);
const Icon kDolarIcon = Icon(
  FontAwesome.dollar,
  color: kShoppingPrimaryIntensiveColor,
  size: 20.0,
);
const Icon kEuroIcon = Icon(
  FontAwesome.euro,
  color: kShoppingPrimaryIntensiveColor,
  size: 20.0,
);
