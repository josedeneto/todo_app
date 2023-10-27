import 'package:app_todo/app/utils/constants/app_constants.dart';
import 'package:app_todo/app/utils/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../utils/colors/app_color.dart';
import '../../utils/helpers/mixins/messages_validate.dart';
import '../../utils/helpers/mixins/todo_validators.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage>
    with Validator, MessageValidator {
  late TextEditingController todoController;
  late TextEditingController dateController;
  late TextEditingController initHourController;
  late TextEditingController finalHourController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    todoController = TextEditingController();
    dateController = TextEditingController();
    initHourController = TextEditingController();
    finalHourController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    todoController.dispose();
    dateController.dispose();
    initHourController.dispose();
    finalHourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text(
          AppConstants.addTodo,
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
                  hintText: AppConstants.whatYourPlane,
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
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now())
                      .then((value) {
                    setState(() {
                      dateController.text = value.toString();
                    });
                  });
                },
                style: const TextStyle(color: AppColor.white),
                cursorColor: AppColor.secondary,
                decoration: InputDecoration(
                  hintText: DateTime.now().toString(),
                  prefixIcon: const Icon(
                    Icons.calendar_month_outlined,
                    size: 25,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    dateController.text = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: AppColor.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.access_time_rounded, size: 21,),
                        hintText: '7:00',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppConstants.to,
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
                         prefixIcon: Icon(Icons.access_time_rounded, size: 21,),
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
                  messageValidator();
                  context.pop(
                    const AddTodoPage(),
                    todoController.text,
                  );
                }
              },
              child: const Icon(
                Icons.check,
              ),
            ),
    );
  }
}
