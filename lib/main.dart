import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicLayoutHomePage(),
    );
  }
}

class MusicLayoutHomePage extends StatelessWidget {
  const MusicLayoutHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text('Edit', style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
    ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildNewReleaseCard(),
                      buildLibraryView(),
                      buildRecentlyAddedContainer(),
                    ],
                  ),
                ),
              ),
              _makeBottomBar()
            ],
          ),
        ),
      ),
    );
}

  Padding buildLibraryView() {
    return Padding(
      padding: const EdgeInsets.only(top: 15,right: 0),
      child: Container(
        width: 900,
        height: 330,
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: buildLibraryItem(),
            ),
            buildLibraryList(Icons.queue_music, 'Playlist'),
            buildLibraryList(Icons.mic_rounded, 'Artists'),
            buildLibraryList(Icons.my_library_music_outlined, 'Albums'),
            buildLibraryList(Icons.music_note, 'Songs'),
            buildLibraryListLast(Icons.download_for_offline_outlined, 'Downloaded')
          ],
        ),

      ),
    );
  }

  Padding buildLibraryList(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.white,
                      width: 0.3,
                    )
                  )
                ),
                child: buildLibraryListItem(icon, title),
      ),
    );
  }

  Padding buildLibraryListLast(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 0.3,
                ),
                bottom: BorderSide(
                  color: Colors.white,
                  width: 0.3,
                )
            )
        ),
        child: buildLibraryListItem(icon, title),
      ),
    );
  }

  Padding buildLibraryListItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.red, size: 32,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(title, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24
                ),),
              ),
            ],
          ),
          const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        ],
      ),
    );
  }

  Row buildLibraryItem() {
    return Row(
            children: const [
              Text('Library', style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),)
            ],
          );
  }

  Padding buildNewReleaseCard() {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(

          width: 500,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFF424242),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.music_note, color: Colors.white,),
                        Text('Music', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                        ),)
                    ],
                    ),
                    Icon(Icons.close_sharp, color: Colors.grey,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset("images/vova.png"))
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('NEW RELEASE', style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8,

                              ),),
                              Text('Вова, ї*аш їх - Single', style: TextStyle(
                                  color: Colors.white
                              ),),
                              Text('Мюслі UA', style: TextStyle(
                                  color: Colors.grey,
                                fontSize: 10
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
    );
  }

  Padding buildRecentlyAddedContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: const [
               Text('Recently Added', style: TextStyle(
                 color: Colors.white,
                 fontSize: 24,
                 fontWeight: FontWeight.bold
               ),
               ),
            ]
            ),
          ),
          buildPhotosGrid()
        ],
      ),
    );
  }

  Container buildPhotosGrid() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(10, (index) {
          return Expanded(
              child: Column(
                children: [
                  Expanded(child: Image.asset('images/vova.png')),
                  const Text('gggg', style: TextStyle(
                    color: Colors.white
                  ),)
                ],
              ));
        }),
      ),
    );
  }

  Container _makeBottomBar() {
    return Container(
      height: 60,
      color: Color(0xFF424242),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildTabItem(Icons.play_circle, 'Listen Now'),
            buildTabItem(Icons.grid_view_rounded, 'Browse'),
            buildTabItem(Icons.radio_outlined, 'Radio'),
            buildTabItemActive(Icons.library_music_rounded, 'Library'),
            buildTabItem(Icons.search, 'Search'),
          ],
        ),
      ),
    );
  }

  Column buildTabItem(IconData icon, String title) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey, size: 28,),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(title, style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ],
    );
  }

  Column buildTabItemActive(IconData icon, String title) {
    return Column(
      children: [
        Icon(icon, color: Colors.red, size: 28,),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(title, style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ],
    );
  }
}


