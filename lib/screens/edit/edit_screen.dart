import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_editing_app/main.dart';
import 'package:video_editor/video_editor.dart';
import '../../widgets/custom_edit_button.dart';
import '../../widgets/export_result.dart';
import '../../widgets/reusable_button_widget.dart';
import '../crop/crop_screen.dart';
import '../export_service.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, this.isfromCreateButton});
  bool? isfromCreateButton;
  static const String routeName = '/edit_screen';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final double height = 60;
  final _exportingProgress = ValueNotifier<double>(0.0);
  final _isExporting = ValueNotifier<bool>(false);

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();

    if (widget.isfromCreateButton!) {
      controller = VideoEditorController.file(
        filePath!,
        minDuration: const Duration(seconds: 1),
        maxDuration: const Duration(seconds: 10),
      );
      controller!
          .initialize(aspectRatio: 9 / 16)
          .then((_) => setState(() {}))
          .catchError((error) {
        // handle minimum duration bigger than video duration error
        Navigator.pop(context);
      }, test: (e) => e is VideoMinDurationError);
    }
  }

  void _showErrorSnackBar(String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );

  /// For Export Video
  void _exportVideo() async {
    _exportingProgress.value = 0;
    _isExporting.value = true;

    final config = VideoFFmpegVideoEditorConfig(
      controller!,
      // format: VideoExportFormat.gif,
      // commandBuilder: (config, videoPath, outputPath) {
      //   final List<String> filters = config.getExportFilters();
      //   filters.add('hflip'); // add horizontal flip

      //   return '-i $videoPath ${config.filtersCmd(filters)} -preset ultrafast $outputPath';
      // },
    );

    await ExportService.runFFmpegCommand(
      await config.getExecuteConfig(),
      onProgress: (stats) {
        _exportingProgress.value = config.getFFmpegProgress(stats.getTime());
      },
      onError: (e, s) => _showErrorSnackBar("Error on export video :("),
      onCompleted: (file) {
        _isExporting.value = false;
        if (!mounted) return;

        showDialog(
          context: context,
          builder: (_) => VideoResultPopup(video: file),
        );
      },
    );
  }

  /// For Export Cover
  void _exportCover() async {
    final config = CoverFFmpegVideoEditorConfig(controller!);
    final execute = await config.getExecuteConfig();
    if (execute == null) {
      _showErrorSnackBar("Error on cover exportation initialization.");
      return;
    }

    await ExportService.runFFmpegCommand(
      execute,
      onError: (e, s) => _showErrorSnackBar("Error on cover exportation :("),
      onCompleted: (cover) {
        if (!mounted) return;

        showDialog(
          context: context,
          builder: (_) => CoverResultPopup(cover: cover),
        );
      },
    );
  }

  @override
  void dispose() async {
    _exportingProgress.dispose();
    _isExporting.dispose();
    controller!.dispose();
    ExportService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B4461),
        body: Row(
          children: [
            /// For Leif Side Button
            Container(
              padding: EdgeInsets.all(4),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableButtonWidget(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      iconData: Icons.arrow_back_ios_new_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {
                        controller!.rotate90Degrees(RotateDirection.left);
                      },
                      iconData: Icons.rotate_left_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {
                        controller!.rotate90Degrees(RotateDirection.right);
                      },
                      iconData: Icons.rotate_right_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => CropScreen(controller: controller!),
                          ),
                        );
                      },
                      iconData: Icons.crop,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.settings,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.timeline_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.exit_to_app_outlined,
                    ),
                  ],
                ),
              ),
            ),

            /// For Right
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.pinkAccent,
                child: Column(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: widget.isfromCreateButton == false
                                    ? Container(
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.play_arrow_rounded,
                                              size: 50,
                                              color: Colors.white,
                                            )),
                                      )
                                    : Container(
                                        alignment: Alignment.center,
                                        color: Colors.black,
                                        child: controller!.initialized
                                            ? Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  CropGridViewer.preview(
                                                      controller: controller!),
                                                  AnimatedBuilder(
                                                    animation:
                                                        controller!.video,
                                                    builder: (_, __) =>
                                                        AnimatedOpacity(
                                                      opacity:
                                                          controller!.isPlaying
                                                              ? 0
                                                              : 1,
                                                      duration:
                                                          kThemeAnimationDuration,
                                                      child: GestureDetector(
                                                        onTap: controller!
                                                            .video.play,
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: const Icon(
                                                            Icons.play_arrow,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator()),
                                      )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Color(0xff0E2232),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF0B4461)),
                                                child: PopupMenuButton(
                                                  tooltip: 'Open export menu',
                                                  icon: const Icon(Icons.save, color: Colors.white,),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      onTap: _exportCover,
                                                      child: const Text('Export cover'),
                                                    ),
                                                    PopupMenuItem(
                                                      onTap: _exportVideo,
                                                      child: const Text('Export video'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomEditButton(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF0B4461)),
                                                child: Icon(
                                                  Icons.card_giftcard,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller!.isPlaying
                                                    ? 0
                                                    : 1;
                                                  controller!.video.play;

                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFF0B4461)),
                                                child: Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blue,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Function
  // Widget _topNavBar() {
  //   return SafeArea(
  //     child: SizedBox(
  //       height: height,
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: IconButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               icon: const Icon(Icons.exit_to_app),
  //               tooltip: 'Leave editor',
  //             ),
  //           ),
  //           const VerticalDivider(endIndent: 22, indent: 22),
  //           Expanded(
  //             child: IconButton(
  //               onPressed: () =>
  //                   _controller.rotate90Degrees(RotateDirection.left),
  //               icon: const Icon(Icons.rotate_left),
  //               tooltip: 'Rotate unclockwise',
  //             ),
  //           ),
  //           Expanded(
  //             child: IconButton(
  //               onPressed: () =>
  //                   _controller.rotate90Degrees(RotateDirection.right),
  //               icon: const Icon(Icons.rotate_right),
  //               tooltip: 'Rotate clockwise',
  //             ),
  //           ),
  //           Expanded(
  //             child: IconButton(
  //               onPressed: () => Navigator.push(
  //                 context,
  //                 MaterialPageRoute<void>(
  //                   builder: (context) => CropScreen(controller: _controller),
  //                 ),
  //               ),
  //               icon: const Icon(Icons.crop),
  //               tooltip: 'Open crop screen',
  //             ),
  //           ),
  //           const VerticalDivider(endIndent: 22, indent: 22),
  //           Expanded(
  //             child: PopupMenuButton(
  //               tooltip: 'Open export menu',
  //               icon: const Icon(Icons.save),
  //               itemBuilder: (context) => [
  //                 PopupMenuItem(
  //                   child: const Text('Export cover'),
  //                 ),
  //                 PopupMenuItem(
  //                   child: const Text('Export video'),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // String formatter(Duration duration) => [
  //       duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
  //       duration.inSeconds.remainder(60).toString().padLeft(2, '0')
  //     ].join(":");
  //
  // List<Widget> _trimSlider() {
  //   return [
  //     AnimatedBuilder(
  //       animation: Listenable.merge([
  //         _controller,
  //         _controller.video,
  //       ]),
  //       builder: (_, __) {
  //         final int duration = _controller.videoDuration.inSeconds;
  //         final double pos = _controller.trimPosition * duration;
  //
  //         return Padding(
  //           padding: EdgeInsets.symmetric(horizontal: height / 4),
  //           child: Row(children: [
  //             Text(formatter(Duration(seconds: pos.toInt()))),
  //             const Expanded(child: SizedBox()),
  //             AnimatedOpacity(
  //               opacity: _controller.isTrimming ? 1 : 0,
  //               duration: kThemeAnimationDuration,
  //               child: Row(mainAxisSize: MainAxisSize.min, children: [
  //                 Text(formatter(_controller.startTrim)),
  //                 const SizedBox(width: 10),
  //                 Text(formatter(_controller.endTrim)),
  //               ]),
  //             ),
  //           ]),
  //         );
  //       },
  //     ),
  //     Container(
  //       width: MediaQuery.of(context).size.width,
  //       margin: EdgeInsets.symmetric(vertical: height / 4),
  //       child: TrimSlider(
  //         controller: _controller,
  //         height: height,
  //         horizontalMargin: height / 4,
  //         child: TrimTimeline(
  //           controller: _controller,
  //           padding: const EdgeInsets.only(top: 10),
  //         ),
  //       ),
  //     )
  //   ];
  // }
  //
  // Widget _coverSelection() {
  //   return SingleChildScrollView(
  //     child: Center(
  //       child: Container(
  //         margin: const EdgeInsets.all(15),
  //         child: CoverSelection(
  //           controller: _controller,
  //           size: height + 10,
  //           quantity: 8,
  //           selectedCoverBuilder: (cover, size) {
  //             return Stack(
  //               alignment: Alignment.center,
  //               children: [
  //                 cover,
  //                 Icon(
  //                   Icons.check_circle,
  //                   color: const CoverSelectionStyle().selectedBorderColor,
  //                 )
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
