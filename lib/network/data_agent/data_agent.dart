
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';

abstract class DataAgent{
  Future<List<ListVO>?> getLists(String publishedDate);
}