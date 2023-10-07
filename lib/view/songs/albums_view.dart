import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common_widget/albums_cell.dart';
import 'package:music_player/view/songs/albums_detail_view.dart';
import 'package:music_player/view_model/albums_viewmodel.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final albumVM = Get.put(AlbumsViewModel());
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    var cellWidth = (media.width - 40.0 - 20.0) * 0.5;

    return Scaffold(
      body: Obx(() => GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: cellWidth / (cellWidth + 45.0),
                crossAxisSpacing: 20,
                mainAxisSpacing: 10),
            itemCount: albumVM.allList.length,
            itemBuilder: (context, index) {
              var aObj = albumVM.allList[index];
              return AlbumsCell(
                  aObj: aObj,
                  onPressed: () {
                    Get.to(() =>  AlbumsDetailsView());
                  },
                  onPressedMenu: (selectedIndex) {
                    if (kDebugMode) {
                      print(index);
                    }
                  });
            },
          )),
    );
  }
}
