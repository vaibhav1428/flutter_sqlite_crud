import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './services/themeServces.dart';
import './ui/theme.dart';
import './ui/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo pp',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      theme:Themes.light,
      darkTheme: Themes.dark,
      home: const HomePage(),
    );
  }
}
