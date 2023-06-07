import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  AddJournalScreen({Key? key, required this.journal}) : super(key: key);

 final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(WeekDay(journal.createdAt).toString(),style: const TextStyle(fontSize: 16),),
          actions: [IconButton(onPressed: () {
            registerJournal(context);
        },    icon: const Icon(Icons.check),
          )

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: TextField(
          controller: _contentController,
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

  registerJournal(BuildContext context)  {
    String content = _contentController.text;

    journal.content = content;

    JournalService service = JournalService();

    service.register(journal);
      Navigator.pop(context);
  }
}


