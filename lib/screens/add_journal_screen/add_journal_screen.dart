import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final TextEditingController _contentController = TextEditingController();

  AddJournalScreen({Key? key, required this.journal}) : super(key: key);
  JournarlService service = JournarlService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
            "${WeekDay(journal.createdAt.weekday).long} / ${journal.createdAt
                .day} / ${journal.createdAt.month} / ${journal.createdAt.year}",
            style: const TextStyle(fontSize: 16)),
        actions: [IconButton(onPressed: () {
          registerJournal(context);
        }, icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: TextField(
          controller: _contentController,
          autofocus: true,
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

    journal.content = _contentController.text;
    journalService.register(journal).then((value) {
      Navigator.pop(context, value);
    });

  }
}

// registerJournal(BuildContext context) {
//   String content = _contentController.text,
//       journal;content = content;
//
//   JournarlService service = JournarlService();
//   service.register(journal).then((value) {
//     Navigator.pop(context, value);
//   });
// }