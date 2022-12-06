import 'package:flutter/material.dart';
import 'package:gameflix/models/group.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  final _groups = <Group>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text ('que'),
      ),
      body: _groups.isEmpty
        ?const Center(
           child: Text('There are no Groups'),
         )
             :GridView.builder(
        gridDelegate:const SilverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
      ),
      itemCount: _groups.length,
    itemBuilder: (context,index){
          final group = _groups [index];
          return _GroupItem(
    onTap:() => _goToTasks(group),
    group:group,
    );
    },
    ),
  }
}
