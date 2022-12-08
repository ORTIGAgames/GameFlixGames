import 'package:flutter/material.dart';
import '../models/group.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddGroupScreen extends StatefulWidget {
  const AddGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddGroupScreen> createState() => _AddGroupScreenState();
}

  class _AddGroupScreenState extends State<AddGroupScreen> {
  bool isPlayed = false;
  double Score = 0;
  Color selectedColor = Colors.primaries.first;
  final textController = TextEditingController();

  String? errorMessage;

  void toggleSwitch(bool value) {
    if (isPlayed == false) {
      setState(() {
        isPlayed = true;
      });
    }
    else {
      setState(() {
        isPlayed= false;
      });
    }
  }

  void _onSave() {
    final name = textController.text.trim();
    if (name.isEmpty) {
      setState(() {
        errorMessage = 'Name is required';
      });
      return;
    } else {
      setState(() {
        errorMessage = null;
      });
    }
    final result = Group(name: name, color: selectedColor.value, played: isPlayed, score: Score);
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: selectedColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.videogame_asset,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: textController,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: 'Videogame Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                    child:
                    Text('Played', style: TextStyle(fontSize: 20),),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isPlayed,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          errorMessage ?? '',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text('SELECT COLOR'),
                    ),
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: Colors.primaries.length,
                        itemBuilder: (context, index) {
                          final color = Colors.primaries[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: color,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 0,
                    ),
                      child:
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          Score = rating;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: _onSave,
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Create Videogame',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


