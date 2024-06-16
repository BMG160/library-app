
import 'package:flutter/material.dart';
import 'package:flutter_library/page/bookmark_page.dart';
import 'package:flutter_library/page/library_page.dart';



class HomePageBloc extends ChangeNotifier{
  final List<Widget> pages = [const LibraryPage(), const BookmarkPage()];

  int selectedPageIndex = 0;

  List<Widget> get getPages => pages;
  int get getSelectedPageIndex => selectedPageIndex;

  void changePageIndex(int index){
    selectedPageIndex = index;
    notifyListeners();
  }
}
