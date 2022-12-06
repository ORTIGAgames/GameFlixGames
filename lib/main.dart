import 'package:flutter/material.dart';
import 'package:gameflix/models/group.dart';
import 'package:gameflix/models/task.dart';
import 'package:gameflix/ui/add_group_screen.dart';
import 'package:gameflix/ui/groups_screen.dart';
import 'package:gameflix/ui/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? Key}): super(key: Key);
@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'GameFlix',
    theme:ThemeData.light().copyWith(
      appBarTheme:AppBarTheme(
        backgroundColor: Colors.white10,
        elevation:0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context)
          .textTheme
          .headline5!
          .copyWith(fontWeight: FontWeight.w900),
      ),
    ),
    home: const GroupsScreen(),
  );
}

}