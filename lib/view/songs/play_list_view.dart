import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common_widget/my_playlist_cell.dart';
import 'package:music_player/common_widget/play_listsong_cell.dart';
import 'package:music_player/common_widget/view_all_section.dart';
import 'package:music_player/view_model/play_list_viewmodel.dart';

class PlaylistsView extends StatefulWidget {
  const PlaylistsView({super.key});

  @override
  State<StatefulWidget> createState() => _PlaylistsViewState();
}

class _PlaylistsViewState extends State<PlaylistsView> {
  final playAllVM = Get.put(PlaylistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 0),
                itemCount: playAllVM.myPlaylistArr.length,
                itemBuilder: (context, index) {
                  var pObj = playAllVM.playlistArr[index];

                  return PlaylistSongCell(
                      pObj: pObj, onPressed: () {}, onPressedPlay: () {});
                },
              )),
          ViewAllSection(title: "Play Lists", onPressed: () {}),
          SizedBox(
              height: 150,
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: playAllVM.myPlaylistArr.length,
                  itemBuilder: (context, index) {
                    var pObj = playAllVM.myPlaylistArr[index];
                    return MyPlaylistCell(pObj: pObj, onPressed: () {});
                  },
                ),
              ))
        ],
      )),
    );
  }
}
