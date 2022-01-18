import 'package:flutter/material.dart';
import 'package:zireh_demo/Model/transaction.dart';
import 'package:zireh_demo/UI/suggested_food.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zireh_demo/UI/test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionAdapter());

  await Hive.openBox<Transaction>('transactions');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zireh Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fa'), // farsi
      ],
      // theme: ThemeData(
      //     // primarySwatch: Colors.blue,
      //     ),
      home: Directionality(
          textDirection: TextDirection.rtl, child: SuggestedFood()),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
