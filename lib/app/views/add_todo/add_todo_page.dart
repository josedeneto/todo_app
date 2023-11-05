import 'package:app_todo/app/core/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/model/todo_model.dart';
import 'package:app_todo/app/core/style/app_typography.dart';
import 'package:app_todo/app/core/widgets/app_bar_widget.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/colors/app_color.dart';
import '../../core/strings/app_strings.dart';
import '../../core/helpers/mixins/messages_validate.dart';
import '../../core/helpers/mixins/todo_validators.dart';
import 'widget/date_picker_timeline.dart';
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
      body: Padding(
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
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Quando ',
                    style: AppTypography.normal!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'você\n',
                    style: AppTypography.normal!.copyWith(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'vai fazer a sua tarefa?',
                    style: AppTypography.normal!.copyWith(fontSize: 18),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextDescription(
                text: 'Escolha a data',
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
              const TextDescription(
                text: 'Sua tarefa',
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: todoController,
                style: const TextStyle(
                  color: AppColor.white,
                ),
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
              const SizedBox(
                height: 30,
              ),
              const TextDescription(
                text: 'Escolha a hora',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: initHourController,
                      readOnly: true,
                      onTap: showTime,
                      style: const TextStyle(color: AppColor.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.access_time_rounded,
                          size: 21,
                        ),
                        hintText: hourFormat.toString(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppStrings.to,
                      style: AppTypography.normal!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: AppColor.white),
                      decoration: const InputDecoration(
                        hintText: '10:00',
                        prefixIcon: Icon(
                          Icons.access_time_rounded,
                          size: 21,
                        ),
                        hintStyle: TextStyle(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: todoController.text.isEmpty
          ? null
          : FloatingActionButton(
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
              child: const Icon(
                Icons.check,
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
