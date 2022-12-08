import 'task.dart';
import 'package:objectbox/objectbox.dart';


@Entity()
class Group {
  @Id()
  int id = 0;
  String name;
  int color;
  double score = 0.0;
  bool played = false;

  @Backlink()
  final tasks = ToMany<Task>();

  Group({
    required this.name,
    required this.color,
    required this.played,
    required this.score,
  });

  String tasksDescription() {
    final tasksCompleted = tasks.where((task) => task.completed).length;
    if (tasks.isEmpty) {
      return '';
    }
    return '$tasksCompleted of ${tasks.length}';
  }
}
