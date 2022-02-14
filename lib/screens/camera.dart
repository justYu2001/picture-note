import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;
  double _zoom = 1.0;

  void initializeController() async {
    _cameras = await availableCameras();

    var controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _cameraController = controller;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeController();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _cameraController?.dispose();
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

  @override
  Widget build(BuildContext context) {
    bool hasNotch = MediaQuery.of(context).viewPadding.top > 0;

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
                  _iconButton(Icons.flash_off, null),
                  _iconButton(Icons.arrow_forward, null),
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
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
                            onTap: () {},
                            child: const SizedBox(width: 56, height: 56),
                          ),
                        ),
                      )),
                  _iconButton(Icons.flip_camera_android, null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
