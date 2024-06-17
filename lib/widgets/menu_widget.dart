import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library/data/vos/book_vo/book_vo.dart';
import 'package:flutter_library/widgets/easy_text_widget.dart';
import 'package:flutter_library/widgets/horizontal_spacing_widget.dart';
import 'package:flutter_library/widgets/vertical_spacing_widget.dart';

class MenuWidget extends StatelessWidget {
  final BookVO bookVO;
  const MenuWidget({super.key, required this.bookVO});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.5,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(imageUrl: bookVO.bookImage ?? '', fit: BoxFit.fill,),
                  ),
                ),
                const HorizontalSpacingWidget(w: 20),
                SizedBox(
                  width: 200,
                  height: 150,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EasyTextWidget(text: 'Title: ${bookVO.title}', size: 15, weight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
                      const VerticalSpacingWidget(h: 10),
                      EasyTextWidget(text: 'Author: ${bookVO.author}', size: 15, weight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
                      const VerticalSpacingWidget(h: 10),
                      EasyTextWidget(text: 'Rank: ${bookVO.rank}', size: 15, weight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),
                    ],
                  ),
                )
              ],
            ),
          ),
          const VerticalSpacingWidget(h: 10),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          const VerticalSpacingWidget(h: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: EasyTextWidget(text: 'Description: ${bookVO.description}', size: 15, weight: FontWeight.w300, color: Theme.of(context).colorScheme.primary),
          )
        ],
      ),
    );
  }
}
