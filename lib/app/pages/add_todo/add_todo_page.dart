import 'package:uuid/uuid.dart';

import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/model/todo_model.dart';
import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:app_todo/app/pages/add_todo/widget/time_todo.dart';
import 'package:app_todo/app/pages/add_todo/widget/todo_container.dart';
import 'package:app_todo/app/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/colors/app_color.dart';
import '../../core/strings/app_strings.dart';
import '../../core/helpers/mixins/messages_validate.dart';
import '../../core/helpers/mixins/todo_validators.dart';
import 'widget/date_picker_timeline.dart';
import 'widget/question_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage>
    with Validator, MessageValidator {
  late TextEditingController todoController;
  late TextEditingController initHourController;
  late TextEditingController finalHourController;

  String date = DateFormat.yMEd('pt_PT').format(DateTime.now());

  final _formKey = GlobalKey<FormState>();  
  final hourFormat = DateFormat('H:mm').format(DateTime.now());
  final FocusNode _focusNode = FocusNode();
  bool isActiveBorder = false;
  bool isTodoEmpty = false;
  String erroText = '';

  String generateUniqueId() {
    const uuid = Uuid();
    return uuid.v4();
  }

  @override
  void initState() {
    todoController = TextEditingController();
    initHourController = TextEditingController();
    finalHourController = TextEditingController();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isActiveBorder = !isActiveBorder;
        });
      } else {
        setState(() {
          isActiveBorder = !isActiveBorder; //Mudar aqui amanhã
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    initHourController.dispose();
    finalHourController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void showTime(TextEditingController controller) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value != null) {
        final selectedTime = DateTime(0, 0, 0, value.hour, value.minute);
        setState(() {
          controller.text = DateFormat('HH:mm').format(selectedTime);
        });
      } else {
        setState(() {
          controller.text = hourFormat;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.addTodo,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Consumer<HomeController>(
            builder: (context,homeController,child){
              return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const QuestionText(),
                  const SizedBox(height: 20),
                  Text(
                    'Selecione a data',
                    style:theme.textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DatePickerTimeLine(
                    onDateChanged: (selectDate) {
                      final newDate = DateFormat.yMEd('pt_PT').format(selectDate);
                      setState(() {
                        date = newDate;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sua tarefa',
                    style:theme.textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TodoContainer(
                    isDarkMode: homeController.isDarkMode,
                    isEmptyTodo: isTodoEmpty,
                    isActiveBorder: isActiveBorder,
                    child: TextFormField(
                      focusNode: _focusNode,
                      controller: todoController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            isTodoEmpty = true;
                            erroText = 'Opa! Precisa informar uma tarefa';
                          });
                          return '';
                        }
                        return null;
                      },
                      cursorColor: colorScheme.secondary,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.text_fields_rounded,
                          size: 21,
                        ),
                        hintText: AppStrings.whatYourPlane,
                      ),
                      onChanged: (value) {
                        setState(() {
                          todoController.text = value;
                          erroText = '';
                          isTodoEmpty = false;
                        });
                      },
                    ),
                  ),
                  Text(
                    erroText,
                    style: AppTypography.normal!.copyWith(
                        color:colorScheme.onError,
                        fontSize: 13),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                     'Selecione a hora',
                    style:theme.textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TodoContainer(
                    isDarkMode: homeController.isDarkMode,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimeTodo(
                          inputTime: TextFormField(
                            controller: initHourController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                initHourController.text = hourFormat;
                              }
                              return null;
                            },
                            readOnly: true,
                            onTap: () => showTime(initHourController),
                            style: AppTypography.boldText,
                            decoration: InputDecoration(
                              hintStyle: theme.textTheme.headlineMedium,
                              hintText: hourFormat.toString(),
                            ),
                          ),
                          text: 'Início',
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 25,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.white,
                            size: 16,
                          ),
                        ),
                        TimeTodo(
                          inputTime: TextFormField(
                            controller: finalHourController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                finalHourController.text = '10:00';
                              }
                              return null;
                            },
                            onTap: () => showTime(finalHourController),
                            readOnly: true,
                            style: AppTypography.boldText,
                            decoration: InputDecoration(
                              hintText: '10:00',
                              hintStyle: theme.textTheme.headlineMedium,
                            ),
                          ),
                          text: 'Fim',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final id = generateUniqueId();
                        final valid = _formKey.currentState!.validate();
                        if (valid) {
                          final add = context.read<HomeController>();
                          add.addTodo(
                            TodoModel(
                              id: id,
                              title: todoController.text,
                              dataTime: date,
                              time: initHourController.text,
                              createdAt: timeago.format(
                                DateTime.now(),
                                locale: 'pt_pt',
                              ),
                            ),
                          );
                          messageSucessTodo();
                          context.pop(
                            const AddTodoPage(),
                          );
                        }
                      },
                      child: const Text(
                        AppStrings.addTodo,
                      ),
                    ),
                  )
                ],
              ),
            );}
          ),
        ),
      ),
    );
  }
}
