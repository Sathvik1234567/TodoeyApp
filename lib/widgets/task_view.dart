import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTile: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallBack: (checkboxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallBack: (){
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
