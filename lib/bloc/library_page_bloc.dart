import 'package:flutter/material.dart';

import '../data/apply/apply.dart';
import '../data/apply/apply_impl.dart';
import '../data/vos/book_vo/book_vo.dart';
import '../data/vos/list_vo/list_vo.dart';
import '../widgets/menu_widget.dart';

class LibraryPageBloc extends ChangeNotifier{
  final Apply _apply = ApplyImpl();

  List<ListVO>? list;

  List<ListVO>? get getList => list;

  bool bookmarkStatus = false;

  bool _dispose = false;

  bool get isBookmarked => bookmarkStatus;

  bool get isDispose => _dispose;

  LibraryPageBloc(){
    _apply.getLists('2023-03-21');

    _apply.getListsFromDatabaseStream().listen((value){
      list = value;
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

  void showMenu(BuildContext context, BookVO bookVO){
    showModalBottomSheet(
        context: context,
        builder: (context) => MenuWidget(bookVO: bookVO)
    );
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