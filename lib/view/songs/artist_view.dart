import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common_widget/artists_row.dart';
import 'package:music_player/view/songs/artists_details.dart';
import 'package:music_player/view_model/artist_viewmodel.dart';

class ArtistsView extends StatefulWidget {
  const ArtistsView({super.key});

  @override
  State<ArtistsView> createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> {
  final artistVM = Get.put(ArtistsViewModel());
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: artistVM.allList.length,
          itemBuilder: (context, index) {
            var aObj = artistVM.allList[index];

            return ArtistsRow(
                aObj: aObj,
                onPopMenuSelected: (selectIndex) {},
                onPressed: () {
                  Get.to(() => const ArtistsDetailsView());
                });
          },
        ));
  }
}
