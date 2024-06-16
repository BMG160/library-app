
import 'package:flutter_library/data/apply/apply.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';
import 'package:flutter_library/network/data_agent/data_agent.dart';
import 'package:flutter_library/network/data_agent/data_agent_impl.dart';
import 'package:flutter_library/persistent/dao.dart';
import 'package:flutter_library/persistent/dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class ApplyImpl extends Apply{
  ApplyImpl._();
  
  static final ApplyImpl _singleton = ApplyImpl._();
  
  factory ApplyImpl() => _singleton;
  
  final DataAgent _agent = DataAgentImpl();
  final Dao _dao = DaoImpl();

  @override
  Future<List<ListVO>?> getLists(String publishedDate) async {
    await _agent.getLists(publishedDate).then((value) {
      _dao.saveList(value ?? []);
      return value;
    });
    return null;
  }

  @override
  Stream<List<ListVO>?> getListsFromDatabaseStream() => _dao
      .watchListBox()
      .startWith(_dao.getListFromDatabaseStream())
      .map((event) => _dao.getListFromDatabase());

  @override
  void saveList(List<ListVO> list) => _dao.saveList(list);

  @override
  Future<void> addToBookmark(String bookmarkID, BookVO book) => _dao.addToBookmark(bookmarkID, book);

  @override
  BookVO? getBookmarkBookFromDatabase(String bookmarkID) => _dao.getBookmarkBookFromDatabase(bookmarkID);

  @override
  Future<void> removeFromBookmark(String bookmarkID) => _dao.removeFromBookmark(bookmarkID);

}