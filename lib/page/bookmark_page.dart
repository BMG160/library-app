import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/bloc/bookmark_page_bloc.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';
import 'package:flutter_library/widgets/easy_text_widget.dart';
import 'package:flutter_library/widgets/horizontal_spacing_widget.dart';
import 'package:flutter_library/widgets/vertical_spacing_widget.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookmarkPageBloc>(
      create: (_) => BookmarkPageBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Selector<BookmarkPageBloc, List<ListVO>?>(
          selector: (_, bloc) => bloc.getBookmarkList,
          builder: (_, bookmarkList, child) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, listIndex) => (bookmarkList?[listIndex].listBookmarkStatus ?? false) ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: (bookmarkList?[listIndex].listBookmarkStatus ?? false) ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EasyTextWidget(text: bookmarkList?[listIndex].listName ?? '', size: 20, weight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
                      const VerticalSpacingWidget(h: 10),
                      SizedBox(
                        height: 250,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => (bookmarkList?[listIndex].books?[index].bookmarkStatus ?? false) ?
                            SizedBox(
                              width: 150,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Positioned.fill(child: CachedNetworkImage(imageUrl: bookmarkList?[listIndex].books?[index].bookImage ?? '', fit: BoxFit.fill,)),
                                    Positioned.fill(child: Container(
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [Colors.black38, Colors.transparent],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter
                                          )
                                      ),
                                    )),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: BookmarkFavouriteButtonView(bookmarkID: '${bookmarkList?[listIndex].listName}${bookmarkList?[listIndex].books?[index].title}', book: bookmarkList![listIndex].books![index]),
                                    )
                                  ],
                                ),
                              ),
                            ) :
                            const SizedBox(width: 0, height: 0,),
                            separatorBuilder: (context, index) =>(bookmarkList?[listIndex].books?[index].bookmarkStatus ?? false) ? const HorizontalSpacingWidget(w: 10) : const HorizontalSpacingWidget(w: 0),
                            itemCount: bookmarkList?[listIndex].books?.length ?? 0
                        ),
                      )
                    ],
                  ) : const SizedBox(width: 0, height: 0,),
                ) : const SizedBox(width: 0, height: 0,),
                separatorBuilder: (context, listIndex) => const VerticalSpacingWidget(h: 10),
                itemCount: bookmarkList?.length ?? 0
            ),
          ),
        ),
      ),
    );
  }
}

class BookmarkFavouriteButtonView extends StatelessWidget {
  final String bookmarkID;
  final BookVO book;
  const BookmarkFavouriteButtonView({super.key, required this.bookmarkID, required this.book});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          context.read<BookmarkPageBloc>().addBookmark(bookmarkID, book);
        },
        icon: Icon(
          (book.bookmarkStatus ?? false) ? Icons.favorite: Icons.favorite_border,
          color: Theme.of(context).colorScheme.primary,
        )
    );
  }
}
