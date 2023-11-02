import 'package:app_todo/app/model/todo_model.dart';
import 'package:app_todo/app/utils/constants/app_constants.dart';
import 'package:app_todo/app/utils/helpers/extensions/navigators_extension.dart';
import 'package:app_todo/app/utils/style/app_typography.dart';
import 'package:app_todo/app/utils/widgets/app_bar_widget.dart';
import 'package:app_todo/app/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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
  final data = DateFormat.yMEd('pt_PT').format(DateTime.now());

  final _formKey = GlobalKey<FormState>();
  final hourFormat = DateFormat('H:mm').format(DateTime.now());

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
      body:PageView(
        children: [],
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
                      dataTime: dateController.text,
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

  void showDateTime() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2030))
        .then((value) {
      setState(() {
        dateController.text = DateFormat.yMEd('pt_PT').format(value!);
      });
    });
  }

  void showTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        initHourController.text = DateFormat('HH:mm').format(
          DateTime(value?.hour ?? 0,
          value?.minute ?? 0,));
        
      });
    });
  }
}
