import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/bloc/library_page_bloc.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/widgets/easy_text_widget.dart';
import 'package:flutter_library/widgets/horizontal_spacing_widget.dart';
import 'package:flutter_library/widgets/vertical_spacing_widget.dart';
import 'package:provider/provider.dart';

import '../data/vos/list_vo/list_vo.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryPageBloc>(
      create: (_) => LibraryPageBloc(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Selector<LibraryPageBloc, List<ListVO>?>(
          selector: (_, bloc) => bloc.getList,
          builder: (_, list, child) => Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, listIndex) => SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EasyTextWidget(text: list?[listIndex].listName ?? '', size: 20, weight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
                      const VerticalSpacingWidget(h: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, bookIndex) => GestureDetector(
                              onLongPress: (){
                                context.read<LibraryPageBloc>().showMenu(context, list![listIndex].books![bookIndex]);
                              },
                              child: SizedBox(
                                width: 150,
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(child: CachedNetworkImage(imageUrl: list?[listIndex].books?[bookIndex].bookImage ?? '', fit: BoxFit.fill,)),
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
                                        child: FavouriteButtonView(book: list![listIndex].books![bookIndex], bookmarkID: '${list[listIndex].listName}${list[listIndex].books?[bookIndex].title}', ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            separatorBuilder: (context, bookIndex) => const HorizontalSpacingWidget(w: 20),
                            itemCount: list?[listIndex].books?.length ?? 0
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (context, listIndex) => const VerticalSpacingWidget(h: 20),
                itemCount: list?.length ?? 0
            ),
          ),
        ),
      ),
    );
  }
}

class FavouriteButtonView extends StatelessWidget {
  final BookVO book;
  final String bookmarkID;
  const FavouriteButtonView({super.key, required this.book, required this.bookmarkID});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          context.read<LibraryPageBloc>().addBookmark(bookmarkID, book);
        }, 
        icon: Icon(
          (book.bookmarkStatus ?? false) ? Icons.favorite: Icons.favorite_border,
          color: Theme.of(context).colorScheme.primary,
        )
    );
  }
}

