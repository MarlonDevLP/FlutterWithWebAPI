import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import '../../models/journal.dart';

class AddJournalScreen extends StatefulWidget {
  final Journal journal;
  const AddJournalScreen({Key? key, required this.journal}) : super(key: key);

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(WeekDay(widget.journal.createdAt).toString()),
        //style: const TextStyle(fontSize: 16)),
          actions: [IconButton(onPressed: () {
            registerJournal(context);
        },    icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: TextField(
          controller: contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 22, color: Colors.black,
          ),
          expands: true,
          minLines: null,
          maxLines: null,
          decoration: const InputDecoration(
              hintText: 'O que você está pensando hoje?'),
        ),
      ),
    );
  }

  registerJournal(BuildContext context) async {
    JournarlService journalService = JournarlService();
    widget.journal.content = contentController.text;
    journalService.register(widget.journal).then((value){
      if (value) {
      Navigator.pop(context, DisposeStatus.success);
    } else {
      Navigator.pop(context, DisposeStatus.error);
    }
  });
  }
}

enum DisposeStatus { exit, error, success }