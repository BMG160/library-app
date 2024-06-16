
import 'package:flutter_library/constant/hive_constant.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';
import 'package:flutter_library/persistent/dao.dart';
import 'package:hive/hive.dart';

class DaoImpl extends Dao{
  DaoImpl._();

  static final DaoImpl _singleton = DaoImpl._();

  factory DaoImpl() => _singleton;

  Box<ListVO> listBox() => Hive.box<ListVO>(kBoxNameForList);
  Box<BookVO> bookBox() => Hive.box<BookVO>(kBoxNameForBookmark);

  @override
  Future<void> addToBookmark(String bookmarkID, BookVO book) => bookBox().put(bookmarkID, book);

  @override
  BookVO? getBookmarkBookFromDatabase(String bookmarkID) => bookBox().get(bookmarkID);

  @override
  Stream<BookVO?> getBookmarkBookFromDatabaseStream(String bookmarkID) => Stream.value(getBookmarkBookFromDatabase(bookmarkID));

  @override
  List<ListVO>? getListFromDatabase() => listBox().values.toList();

  @override
  Stream<List<ListVO>?> getListFromDatabaseStream() => Stream.value(getListFromDatabase());

  @override
  void saveList(List<ListVO> list) {
    for(ListVO listVO in list){
      for(BookVO book in listVO.books ?? []){
        BookVO? bookmark = getBookmarkBookFromDatabase('${listVO.listName}${book.title}');
        if(bookmark == null){
          if(listVO.listBookmarkStatus == true){
            listVO.listBookmarkStatus = true;
          } else {
            listVO.listBookmarkStatus = false;
          }
          book.bookmarkStatus = false;
        } else {
          listVO.listBookmarkStatus = true;
          book.bookmarkStatus = true;
        }
      }
      listBox().put(listVO.listID, listVO);
    }
  }

  @override
  Stream watchBookmarkBox() => bookBox().watch();

  @override
  Stream watchListBox() => listBox().watch();

  @override
  Future<void> removeFromBookmark(String bookmarkID) => bookBox().delete(bookmarkID);
  // @override
  // List<ListVO>? getListFromDatabase() => listBox().values.toList();
  //
  // @override
  // Stream<List<ListVO>?> getListFromDatabaseStream() => Stream.value(getListFromDatabase());
  //
  // @override
  // void saveList(List<ListVO> list) {
  //   for(ListVO listVO in list){
  //     listBox().put(listVO.listID, listVO);
  //   }
  // }
  //
  // @override
  // Stream watchListBox() => listBox().watch();
  //
  // @override
  // void addToBookmark(String bookmarkID, BookVO book) => bookBox().put(bookmarkID, book);
  //
  // @override
  // BookVO? getBookmarkBooks(String bookmarkID) => bookBox().get(bookmarkID);


}