import 'package:flutter/material.dart';
import 'package:flutter_library/data/apply/apply.dart';
import 'package:flutter_library/data/apply/apply_impl.dart';

import '../data/vos/book_vo/book_vo.dart';
import '../data/vos/list_vo/list_vo.dart';

class BookmarkPageBloc extends ChangeNotifier{
  final Apply _apply = ApplyImpl();

  List<ListVO>? bookmarkList;

  bool _dispose = false;

  List<ListVO>? get getBookmarkList => bookmarkList;

  bool get isDispose => _dispose;

  BookmarkPageBloc(){
    _apply.getLists('2023-03-21');

    _apply.getListsFromDatabaseStream().listen((value){
      bookmarkList = value;
      notifyListeners();
    });
  }

  Future<void> addBookmark(String bookmarkID, BookVO book)async {
    BookVO? bookFromDatabase = _apply.getBookmarkBookFromDatabase(bookmarkID);
    if(bookFromDatabase == null) {
      await _apply.addToBookmark(bookmarkID, book);
    } else {
      await _apply.removeFromBookmark(bookmarkID);
    }
    await _apply.getLists('2023-03-21');
  }

  @override
  void notifyListeners() {
    if(!_dispose){
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}