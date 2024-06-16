import 'package:flutter/material.dart';
import 'package:flutter_library/bloc/home_page_bloc.dart';
import 'package:flutter_library/bloc/theme_bloc.dart';
import 'package:flutter_library/widgets/easy_text_widget.dart';
import 'package:flutter_library/widgets/horizontal_spacing_widget.dart';
import 'package:flutter_library/widgets/vertical_spacing_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
        create: (_) => HomePageBloc(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            leading: Builder(
              builder: (context) => IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  )
              ),
            ),
            title: SizedBox(
              width: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.bookOpen, color: Theme.of(context).colorScheme.primary, size: 30,),
                  const HorizontalSpacingWidget(w: 10),
                  EasyTextWidget(text: 'LIBRARY',color: Theme.of(context).colorScheme.primary, size: 25, weight: FontWeight.w900)
                ],
              ),
            ),
          ),
          body: Selector<HomePageBloc, List<Widget>>(
            selector: (_, bloc) => bloc.getPages,
            builder: (_, pages, child) => Selector<HomePageBloc, int>(
              selector: (_, bloc) => bloc.getSelectedPageIndex,
              builder: (_, selectedPageIndex, child) => pages[selectedPageIndex],
            ),
          ),
          drawer: Drawer(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Selector<HomePageBloc, int>(
              selector: (_, bloc) => bloc.getSelectedPageIndex,
              builder: (_, selectedPageIndex, child) => Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacingWidget(h: MediaQuery.of(context).size.height*0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.gear,
                          color: Theme.of(context).colorScheme.primary,
                          size: 25,
                        ),
                        const HorizontalSpacingWidget(w: 10),
                        EasyTextWidget(text: 'SETTING', color: Theme.of(context).colorScheme.primary, size: 20, weight: FontWeight.w600)
                      ],
                    ),
                    const VerticalSpacingWidget(h: 20),
                    Divider(
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    VerticalSpacingWidget(h: MediaQuery.of(context).size.height*0.1),
                    LibraryPageListTileView(selectedPageIndex: selectedPageIndex),
                    const VerticalSpacingWidget(h: 10),
                    BookmarkPageListTileView(selectedPageIndex: selectedPageIndex),
                    const VerticalSpacingWidget(h: 10),
                    const ThemeModeView(),
                    VerticalSpacingWidget(h: MediaQuery.of(context).size.height*0.1),
                    Divider(
                      height: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    VerticalSpacingWidget(h: MediaQuery.of(context).size.height*0.1),
                    EasyTextWidget(text: 'This application is developed by Pyae Sone', size: 15, weight: FontWeight.w300, color: Theme.of(context).colorScheme.primary, align: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavigationView(),
        ),
    );
  }
}

class LibraryPageListTileView extends StatelessWidget {
  final int selectedPageIndex;
  const LibraryPageListTileView({super.key, required this.selectedPageIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      leading: FaIcon(
        FontAwesomeIcons.house,
        color: (selectedPageIndex == 0) ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
        size: 20,
      ),
      tileColor: (selectedPageIndex == 0) ? Theme.of(context).colorScheme.primary : Colors.transparent,
      title: (selectedPageIndex == 0) ? EasyTextWidget(text: 'Home', color: Theme.of(context).colorScheme.surface, size: 15, weight: FontWeight.w100) : EasyTextWidget(text: 'Home', color: Theme.of(context).colorScheme.primary, size: 15, weight: FontWeight.w100),
      onTap: (){
        context.read<HomePageBloc>().changePageIndex(0);
        Navigator.pop(context);
      },
    );
  }
}

class BookmarkPageListTileView extends StatelessWidget {
  final int selectedPageIndex;
  const BookmarkPageListTileView({super.key, required this.selectedPageIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      leading: FaIcon(
        FontAwesomeIcons.bookBookmark,
        color:(selectedPageIndex == 1) ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primary,
        size: 20,
      ),
      tileColor: (selectedPageIndex == 1) ? Theme.of(context).colorScheme.primary : Colors.transparent,
      title: (selectedPageIndex == 1) ? EasyTextWidget(text: 'Bookmark', size: 15, color: Theme.of(context).colorScheme.surface, weight: FontWeight.w100) : EasyTextWidget(text: 'Bookmark', size: 15, color: Theme.of(context).colorScheme.primary, weight: FontWeight.w100),
      onTap: (){
        context.read<HomePageBloc>().changePageIndex(1);
        Navigator.pop(context);
      },
    );
  }
}

class ThemeModeView extends StatelessWidget {
  const ThemeModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeBloc, bool>(
      selector: (_, bloc) => bloc.isLightMode,
      builder: (_, lightMode, child) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: (lightMode) ?
          ListTile(
            key: UniqueKey(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            leading: Icon(Icons.nightlight, color: Theme.of(context).colorScheme.primary, size: 20,),
            title: EasyTextWidget(text: 'Current Mode', size: 15, weight: FontWeight.w100, color: Theme.of(context).colorScheme.primary),
            subtitle: EasyTextWidget(text: 'Dark Mode', size: 10, weight: FontWeight.w100, color: Theme.of(context).colorScheme.primary),
            onTap: (){
              Provider.of<ThemeBloc>(context, listen: false).toggleThemeMode();
            },
          ) :
          ListTile(
            key: UniqueKey(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            leading: Icon(Icons.sunny, color: Theme.of(context).colorScheme.primary, size: 20,),
            title: EasyTextWidget(text: 'Current Mode', size: 15, weight: FontWeight.w100, color: Theme.of(context).colorScheme.primary),
            subtitle: EasyTextWidget(text: 'Light Mode', size: 10, weight: FontWeight.w100, color: Theme.of(context).colorScheme.primary),
            onTap: (){
              Provider.of<ThemeBloc>(context, listen: false).toggleThemeMode();
            },
          ),
      ),
    );
  }
}

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, int>(
      selector: (_, bloc) => bloc.getSelectedPageIndex,
      builder: (_, selectedPageIndex, child) => BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          selectedIconTheme: const IconThemeData(size: 25),
          unselectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedIconTheme: const IconThemeData(size: 20),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedPageIndex,
          onTap: (index){
            context.read<HomePageBloc>().changePageIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Library'
            ),
            BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.bookBookmark),
                label: 'Bookmark'
            ),
          ]
      ),
    );
  }
}




