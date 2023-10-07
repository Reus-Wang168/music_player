import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common_widget/all_songs_row.dart';
import 'package:music_player/view/main_player/main_player_view.dart';
import 'package:music_player/view_model/all_songs_viewmodel.dart';

class AllSongsView extends StatefulWidget {
  const AllSongsView({super.key});

  @override
  State<AllSongsView> createState() => _AllSongsViewState();
}

class _AllSongsViewState extends State<AllSongsView> {
  final allVM = Get.put(AllSongsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          var sObj = allVM.allList[index];
          return AllSongsRow(
              sObj: sObj,
              onPressedPlay: () {
                Get.to(() => const MainPlayerView());
              },
              onPressed: () {});
        },
        itemCount: allVM.allList.length,
      ),
    ));
  }
}
