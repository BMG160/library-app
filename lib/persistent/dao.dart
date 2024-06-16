
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';

abstract class Dao{
  void saveList(List<ListVO> list);

  Future<void> addToBookmark(String bookmarkID, BookVO book);

  Future<void> removeFromBookmark (String bookmarkID);

  List<ListVO>? getListFromDatabase();

  BookVO? getBookmarkBookFromDatabase (String bookmarkID);

  Stream<List<ListVO>?> getListFromDatabaseStream();

  Stream<BookVO?> getBookmarkBookFromDatabaseStream (String bookmarkID);


  Stream watchListBox();

  Stream watchBookmarkBox();



  // void saveList(List<ListVO> list);
  //
  // void addToBookmark(String bookmarkID, BookVO book);
  //
  // List<ListVO>? getListFromDatabase();
  //
  // BookVO? getBookmarkBooks(String bookmarkID);
  //
  // Stream<List<ListVO>?> getListFromDatabaseStream();
  //
  // Stream watchListBox();
}