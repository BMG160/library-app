
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';

import '../vos/book_vo/book_vo.dart';

abstract class Apply{
  Future<List<ListVO>?> getLists(String publishedDate);

  Stream<List<ListVO>?> getListsFromDatabaseStream();

  void saveList(List<ListVO> list);

  Future<void> addToBookmark(String bookmarkID, BookVO book);

  BookVO? getBookmarkBookFromDatabase (String bookmarkID);

  Future<void> removeFromBookmark (String bookmarkID);
}