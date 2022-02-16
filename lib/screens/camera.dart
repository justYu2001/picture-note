import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class Camera extends StatefulWidget {
  final PageController _pageController;

  const Camera(this._pageController, {Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> with WidgetsBindingObserver {
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;

  double _zoom = 1.0;

  FlashMode _flashMode = FlashMode.off;
  IconData _flashModeIcon = Icons.flash_off;

  File? _latestImage;

  void initializeController([CameraDescription? cameraDescription]) async {
    _cameras = await availableCameras();

    cameraDescription ??= _cameras[0];

    var controller = CameraController(cameraDescription, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _cameraController = controller;
      });
    });
  }

  void initializeLatestImage() async {
    List<AssetPathEntity> imagePathList = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );

    final path = imagePathList[0];
    final imageList = await path.getAssetListRange(start: 0, end: 1);
    AssetEntity imageEntity = imageList[0];
    var latestImage = await imageEntity.file;

    setState(() {
      _latestImage = latestImage;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      initializeLatestImage();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    initializeController();
    initializeLatestImage();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  Widget _iconButton(IconData icon, onPressedHandler) {
    return InkWell(
      child: Icon(
        icon,
        size: 32.0,
        color: Colors.white,
      ),
      onTap: onPressedHandler,
    );
  }

  Widget? _latestImagePreview() {
    if(_latestImage == null) {
      return null;
    } else {
      return Image.file(
        _latestImage!,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasNotch = MediaQuery.of(context).viewPadding.top > 0;

    _cameraController?.setFlashMode(_flashMode);

    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      );
    }

    return CameraPreview(
      _cameraController!,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: hasNotch ? 0.0 : 18.0,
                horizontal: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32.0),
                  _iconButton(_flashModeIcon, () {
                    if(_flashMode == FlashMode.off) {
                      _flashMode = FlashMode.always;

                      setState(() {
                        _flashModeIcon = Icons.flash_on;
                      });
                    } else if(_flashMode == FlashMode.always) {
                      _flashMode = FlashMode.auto;

                      setState(() {
                        _flashModeIcon = Icons.flash_auto;
                      });
                    } else {
                      _flashMode = FlashMode.off;

                      setState(() {
                        _flashModeIcon = Icons.flash_off;
                      });
                    }

                    _cameraController?.setFlashMode(_flashMode);
                  }),
                  _iconButton(Icons.arrow_forward, () {
                    widget._pageController.animateToPage(
                        1,
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.ease,
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onScaleUpdate: (scaleStartDetails) {
                  double newZoom = 0.0;
                  if (scaleStartDetails.scale > 1.0) {
                    newZoom = _zoom + 0.05;
                  } else if (scaleStartDetails.scale < 1.0) {
                    newZoom = _zoom - 0.05;
                  }

                  if (newZoom >= 1.0 && newZoom <= 9.0) {
                    _zoom = newZoom;
                  }

                  _cameraController?.setZoomLevel(_zoom);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: hasNotch ? 0.0 : 24.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 36.0,
                    height: 36.0,
                    child: InkWell(
                      onTap: null,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        child: _latestImagePreview(),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                      padding: const EdgeInsets.all(1.0),
                      child: ClipOval(
                        child: Material(
                          color: Colors.white,
                          child: InkWell(
                            splashColor: Colors.grey[300]?.withOpacity(0.7),
                            splashFactory: InkRipple.splashFactory,
                            onTap: () async {
                              final image = await _cameraController?.takePicture();
                            },
                            child: const SizedBox(width: 56, height: 56),
                          ),
                        ),
                      )),
                  _iconButton(Icons.flip_camera_android, () {
                    final lensDirection = _cameraController?.description.lensDirection;

                    CameraDescription newCameraDescription;

                    if(lensDirection == CameraLensDirection.front) {
                      newCameraDescription = _cameras.firstWhere((camera) {
                        return camera.lensDirection == CameraLensDirection.back;
                      });
                    } else {
                      newCameraDescription = _cameras.firstWhere((camera) {
                        return camera.lensDirection == CameraLensDirection.front;
                      });
                    }

                    initializeController(newCameraDescription);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
