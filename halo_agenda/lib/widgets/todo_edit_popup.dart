import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haloagenda/enums/priority_kind.dart';
import 'package:haloagenda/models/tasks_brain.dart';
import 'package:provider/provider.dart';

import '../constans.dart';
import '../enums/repeat_kind.dart';
import '../models/task.dart';
import '../widgets/custom_dropdown_menu.dart';
import '../widgets/custom_textfield.dart';
import 'custom_popup_menu_button.dart';
import 'custom_priority_container.dart';

class TodoEditPopup extends StatefulWidget {
  final Task task;

  TodoEditPopup({@required this.task});

  @override
  _TodoEditPopupState createState() => _TodoEditPopupState();
}

String dateFormat(DateTime time) {
  if (time == null) return null;
  return '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}';
}

class _TodoEditPopupState extends State<TodoEditPopup> {
  RepeatKind selectedRepeatKind;
  DateTime selectedDate;
  PriorityKind selectedPriorityKind;
  String errorMessagePickDate;
  String errorMeessageRepeatCount;
  String errorMeessageRepeatDistance;

  final taskNameTextController = TextEditingController();
  final taskDescriptionTextController = TextEditingController();
  final taskDateTextController = TextEditingController();
  final taskRepeatCountTextController = TextEditingController();
  final taskRepeatDistanceTextController = TextEditingController();
  @override
  void initState() {
    super.initState();

    taskNameTextController.text = widget.task.name ?? '';

    taskDescriptionTextController.text = widget.task.description ?? '';

    selectedRepeatKind = widget.task.repeatKind;

    selectedDate = widget.task.date;

    taskRepeatCountTextController.text = widget.task.repeatCount.toString();

    taskRepeatDistanceTextController.text =
        widget.task.repeatDistance.toString();

    taskDateTextController.text = (dateFormat(widget.task.date) ?? '');

    selectedPriorityKind = widget.task.priority;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      elevation: 16,
      title: Text(
        'Task Edit',
        style: kGroupTitleTextStyle,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //TODO : Name
          CustomTextField(
            hintText: 'Task Title',
            prefixIcon: kTodoGroupIcon,
            messageTextController: taskNameTextController,
            maxLength: 40,
          ),
          //TODO : Description
          CustomTextField(
            hintText: 'Description',
            prefixIcon: kTaskDescriptionIcon,
            maxLine: 4,
            minLine: 1,
            messageTextController: taskDescriptionTextController,
            maxLength: 130,
          ),
          //TODO : Repeat Kind
          CustomDropdownMenu(
            items: RepeatKindClass.repeatKindNameList.values.toList(),
            prefixIcon:
                RepeatKindClass.repeatKindIcon24List[selectedRepeatKind],
            onChangedFunction: (newValue) {
              setState(() {
                selectedRepeatKind = RepeatKindClass.getNameKey(newValue);
              });
            },
            selectedValue:
                RepeatKindClass.repeatKindNameList[selectedRepeatKind],
          ),
          //TODO : Pick Date
          Visibility(
            visible: selectedRepeatKind == RepeatKind.count ? false : true,
            child: CustomTextField(
              hintText: 'Pick Date',
              errorText: errorMessagePickDate,
              prefixIcon: selectedRepeatKind == RepeatKind.untilDate
                  ? kTaskDateIcon
                  : kTaskRepeatOneIcon24,
              messageTextController: taskDateTextController,
              readOnly: true,
              onTapTexfield: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          minimumDate: DateTime.now(),
                          mode: CupertinoDatePickerMode.dateAndTime,
                          use24hFormat: true,
                          onDateTimeChanged: (DateTime time) {
                            setState(() {
                              errorMessagePickDate = null;
                              selectedDate = time;
                              taskDateTextController.text = dateFormat(time);
                            });
                          },
                        ),
                      );
                    });
              },
            ),
          ),
          //TODO : Repeat Count
          Visibility(
            visible: selectedRepeatKind == RepeatKind.count ? true : false,
            child: CustomTextField(
              prefixIcon: kTaskRepetitionIcon24,
              suffixText: 'Repeat Count',
              errorText: errorMeessageRepeatCount,
              messageTextController: taskRepeatCountTextController,
            ),
          ),
          //TODO : Repeat Distance
          Visibility(
            visible: selectedRepeatKind == RepeatKind.oneTime ? false : true,
            child: CustomTextField(
              suffixText: 'Day Distance',
              errorText: errorMeessageRepeatDistance,
              prefixIcon: kTaskRepeatCountIcon,
              messageTextController: taskRepeatDistanceTextController,
            ),
          ),
          //TODO : Priority
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO :  Low Priority
              Expanded(
                child: CustomPriorityContainer(
                  priorityKind: PriorityKind.low,
                  priorityKindTemp: selectedPriorityKind,
                  onPressed: () {
                    setState(() {
                      selectedPriorityKind = PriorityKind.low;
                    });
                  },
                ),
              ),
              //TODO : Low medium
              Expanded(
                child: CustomPriorityContainer(
                  priorityKind: PriorityKind.medium,
                  priorityKindTemp: selectedPriorityKind,
                  onPressed: () {
                    setState(() {
                      selectedPriorityKind = PriorityKind.medium;
                    });
                  },
                ),
              ),
              //TODO :  high Priority
              Expanded(
                child: CustomPriorityContainer(
                  priorityKind: PriorityKind.high,
                  priorityKindTemp: selectedPriorityKind,
                  onPressed: () {
                    setState(() {
                      selectedPriorityKind = PriorityKind.high;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CustomPopupMenuButton(
                  'Delete',
                  color: kAppDeleteColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);

                    Provider.of<TaskBrain>(context, listen: false)
                      ..removeTaskWithDB(widget.task);
                  },
                ),
              ),
              Expanded(
                child: CustomPopupMenuButton(
                  'Save',
                  color: kTodoPrimaryColor,
                  onPressed: () {
                    setState(() {
                      errorMeessageRepeatDistance = null;
                      errorMeessageRepeatCount = null;
                      errorMessagePickDate = null;
                    });
                    if (selectedRepeatKind == RepeatKind.untilDate &&
                        selectedDate == null) {
                      setState(() {
                        errorMessagePickDate =
                            'Date can\'t be empty when you chose Until Date.';
                      });
                      return;
                    }

                    try {
                      widget.task.repeatCount =
                          int.parse(taskRepeatCountTextController.text);
                    } catch (e) {
                      setState(() {
                        errorMeessageRepeatCount = 'Just number';
                      });
                      return;
                    }

                    try {
                      widget.task.repeatDistance =
                          int.parse(taskRepeatDistanceTextController.text);
                    } catch (e) {
                      setState(() {
                        errorMeessageRepeatDistance = 'Just number';
                      });
                      return;
                    }

                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);

                    widget.task.name = taskNameTextController.text;

                    widget.task.description =
                        taskDescriptionTextController.text;

                    widget.task.repeatKind = selectedRepeatKind;

                    widget.task.date = selectedRepeatKind == RepeatKind.count
                        ? null
                        : selectedDate;

                    widget.task.priority = selectedPriorityKind;

                    Provider.of<TaskBrain>(context, listen: false)
                        .updateTask(widget.task);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
