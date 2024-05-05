
 class TaskModel {
  String? id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone = true ;

  TaskModel(
      {
        this.id,
      required this.title,
      required this.description,
      required this.dateTime,
      });
  void isChanged() {
  isDone = !isDone;
  }
  }
