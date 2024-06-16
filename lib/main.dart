import 'package:flutter/material.dart';
import 'package:flutter_library/bloc/theme_bloc.dart';
import 'package:flutter_library/constant/hive_constant.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/data/vos/buy_link_vo/buy_link_vo.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';
import 'package:flutter_library/page/home_page.dart';
import 'package:flutter_library/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{

  await Hive.initFlutter();

  Hive.registerAdapter(ListVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(BuyLinkVOAdapter());

  await Hive.openBox<ListVO>(kBoxNameForList);
  await Hive.openBox<BookVO>(kBoxNameForBookmark);

  runApp(
    ChangeNotifierProvider<ThemeBloc>(
      create: (_) => ThemeBloc(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeBloc, ThemeData>(
      selector: (_, bloc) => bloc.getThemeData,
      builder: (_, themeData, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        darkTheme: darkMode,
        home: HomePage(),
      ),
    );
  }
}

