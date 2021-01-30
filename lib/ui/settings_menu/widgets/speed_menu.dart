import 'package:flutter/material.dart';
import 'package:video_viewer/data/repositories/video.dart';
import 'package:video_viewer/ui/settings_menu/widgets/helpers.dart';
import 'package:video_viewer/ui/settings_menu/widgets/seconday_menu.dart';

class SpeedMenu extends StatelessWidget {
  const SpeedMenu({Key key, @required this.closeMenu}) : super(key: key);

  final void Function() closeMenu;

  @override
  Widget build(BuildContext context) {
    final query = VideoQuery();
    final video = query.video(context, listen: true);
    final metadata = query.videoMetadata(context, listen: true);

    final speed = video.controller.value.playbackSpeed;

    return SecondaryMenu(
      closeMenu: closeMenu,
      children: [
        for (double i = 0.5; i <= 2; i += 0.25)
          CustomInkWell(
            onTap: () {
              query.video(context).controller.setPlaybackSpeed(i);
              closeMenu?.call();
            },
            child: CustomText(
                text: i == 1.0 ? metadata.language.normalSpeed : "x$i",
                selected: i == speed),
          ),
      ],
    );
  }
}
