import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/add_journal_screen/add_journal_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.black87,
            titleTextStyle: TextStyle(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.green),
            iconTheme:  IconThemeData(color: Colors.green),
          ),
          textTheme: GoogleFonts.bitterTextTheme()),
      initialRoute: "home",
      routes: {
        "home": (context) => const HomeScreen(),
      },
      onGenerateRoute: (routeSettings){
        if(routeSettings.name == "add-journal"){
          final  journal = routeSettings.arguments as Journal;
          return MaterialPageRoute(builder: (context){
            return AddJournalScreen(journal: journal);
          });
        }
        return null;
      },
    );
  }
}
