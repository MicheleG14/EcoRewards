import 'package:camera/camera.dart';
import 'package:ecorewards/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/qrcode_overlay.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Obtain a list of available cameras on the device.
    final camerasFuture = availableCameras();
    _initializeControllerFuture = camerasFuture.then((cameras) {
      // Select the first available camera
      _controller = CameraController(cameras[0], ResolutionPreset.max);

      // Initialize the controller
      return _controller.initialize();
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            // If the controller is initialized, display the camera preview
            return ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionScreen()));
              },
              child: Stack(fit: StackFit.expand, children: [
                CameraPreview(_controller), // container
                Container(
                  constraints: const BoxConstraints.expand(),
                  child: CustomPaint(
                      size: const Size.fromWidth(20),
                      painter: QrCodeOverlay(
                          radius: 35,
                          radiusWidth: 35,
                          sizeOfShape: const Size(250, 250),
                          bordersColor: Colors.grey)),
                )
              ]),
            );
          } else {
            // Otherwise, display a loading indicator until the controller is initialized
            return const Center(child: CircularProgressIndicator(color: Colors.black,));
          }
        },
      ),
    );
  }
}
