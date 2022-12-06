import 'package:flutter/material.dart';
import 'package:gameflix/models/group.dart';
import 'package:gameflix/models/task.dart';
import 'package:gameflix/ui/add_group_screen.dart';
import 'package:objectbox/objectbox.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {

  final _groups = <Group>[];
  late final Store _store;
  late final Box<Group> _groupsBox;

  Future<void> _addGroup() async {
    final result = await showDialog(
      context: context,
      builder: (_) => const AddGroupScreen(),
    );

    if (result != null) {

    }
  }

  Future<void> _loadGroups() {
    _groupBox.getAll();
  }

  Future <void> _loadStore() async {
    _store = await openStore();
    _groupsBox = _store.box <Group>();
    _loadGroups();
  }

  @override
  void initState() {
    _loadStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ('TO DO list'),
      ),
      body: _groups.isEmpty
          ? const Center(
              child: Text('There are no Groups'),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                final group = _groups [index];
                return _GroupItem(
                  onTap: () => null, //_goToTasks(group),
                  group: group,
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _addGroup,
          label: const Text ('Add group')
      ),
    );
  }
}

class _GroupItem extends StatelessWidget {

  final Group group;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final description = group.tasksDescription();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Color(group.color),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                group.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22
                ),
              ),
              if (description.isNotEmpty)...[
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
