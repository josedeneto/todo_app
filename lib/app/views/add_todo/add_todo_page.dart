import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/model/todo_model.dart';
import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:app_todo/app/core/widgets/app_bar_widget.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/colors/app_color.dart';
import '../../core/strings/app_strings.dart';
import '../../core/helpers/mixins/messages_validate.dart';
import '../../core/helpers/mixins/todo_validators.dart';
import 'widget/date_picker_timeline.dart';
import 'widget/question_text.dart';
import 'widget/text_description.dart';

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

  String date = '';
  final _formKey = GlobalKey<FormState>();
  final hourFormat = DateFormat('H:mm').format(DateTime.now());

  @override
  void initState() {
    todoController = TextEditingController();
    initHourController = TextEditingController();
    finalHourController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    initHourController.dispose();
    finalHourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text(
          AppStrings.addTodo,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const QuestionText(),
                const SizedBox(
                  height: 20
                ),
                TextDescription(
                  text: 'Escolha a data',
                  style: AppTypography.normal!.copyWith(
                    fontSize: 14,
                  ),
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
                TextDescription(
                  text: 'Sua tarefa',
                  style: AppTypography.normal!.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.border.withOpacity(0.8),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: AppColor.background,
                  ),
                  child: TextFormField(
                    controller: todoController,
                    style: AppTypography.normal,
                    validator: validatorTodo,
                    cursorColor: AppColor.secondary,
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
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextDescription(
                  text: 'Escolha a hora',
                  style: AppTypography.normal!.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.border.withOpacity(0.8),
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: AppColor.background,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDescription(
                              text: 'Começo',
                              style: AppTypography.normal!.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextFormField(
                              controller: initHourController,
                              readOnly: true,
                              onTap: showTime,
                              style: AppTypography.boldText,
                              decoration: InputDecoration(
                                hintStyle: AppTypography.boldText,
                                hintText: hourFormat.toString(),
                                
                              ),
                            ),
                          ],
                        ),
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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDescription(
                              text: 'Fim',
                              style: AppTypography.normal!.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextFormField(
                              style: AppTypography.boldText,
                              decoration: InputDecoration(
                                hintText: '10:00',
                                hintStyle: AppTypography.boldText,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                 SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid = _formKey.currentState!.validate();
                            if (valid) {
                              final add = context.read<HomeController>();
                              add.addTodo(
                                TodoModel(
                                  title: todoController.text,
                                  dataTime: date,
                                  time: initHourController.text,
                                ),
                              );
                            }
                            context.pop(
                              const AddTodoPage(),
                            );
                          },
                          child: const Text('Adicionar tarefa'),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        initHourController.text = DateFormat('HH:mm').format(DateTime(
          value?.hour ?? 0,
          value?.minute ?? 0,
        ));
      });
    });
  }
}
