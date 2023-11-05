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

  String data = '';
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
            mainAxisSize: MainAxisSize.min,
            children: [
              DatePicker(
                deactivatedColor: Colors.yellow,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                dateTextStyle: AppTypography.normal!.copyWith(
                  color: AppColor.hint,
                  fontSize: 20,
                ),
                width: 80,
                onDateChange: (selectedDate) {
                  final newData = DateFormat.yMEd('pt_PT').format(selectedDate);
                  setState(() {
                    data = newData;
                  });
                },
                selectedTextColor: AppColor.white,
                monthTextStyle: AppTypography.normal!.copyWith(
                  color: AppColor.grey,
                  fontSize: 14,
                ),
                selectionColor: AppColor.secondary,
                dayTextStyle: AppTypography.normal!.copyWith(
                  color: AppColor.grey,
                  fontSize: 14,
                ),
                height: 100,
              ),
              TextFormField(
                controller: todoController,
                style: const TextStyle(color: AppColor.white),
                validator: validatorTodo,
                cursorColor: AppColor.secondary,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.access_time_rounded,
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
                height: 15,
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
                        dataTime: data,
                        time: initHourController.text),
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
